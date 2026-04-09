$pages = @('furnaces.html','boilers.html','combi-boiler.html','hot-water-tanks.html','tankless.html','rooftop.html','unit-heaters.html')

foreach ($p in $pages) {
  $path = "C:\Users\ryans\acecomfort-website\heating\$p"
  $c = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

  # Use regex to capture the image filename and the inner content between z-index:2;"> and </div></section>
  $pattern = '(?s)<section class="page-hero" style="position:relative;overflow:hidden;min-height:220px;max-height:280px;"><img src="\.\./images/([^"]+)" alt="" style="position:absolute;right:0;top:0;height:100%;width:38%;object-fit:cover;object-position:center;z-index:0;" /><div style="position:absolute;inset:0;background:linear-gradient\(90deg,rgba\(10,22,45,0\.97\) 0%,rgba\(10,22,45,0\.90\) 55%,rgba\(10,22,45,0\.15\) 100%\);z-index:1;"></div><div class="container" style="position:relative;z-index:2;">(.*?)</div></section>'

  $match = [System.Text.RegularExpressions.Regex]::Match($c, $pattern)

  if ($match.Success) {
    $img     = $match.Groups[1].Value
    $content = $match.Groups[2].Value

    $new = '<section class="page-hero" style="padding:0;overflow:hidden;"><div style="display:flex;align-items:center;"><div style="flex:1;padding:50px 0;"><div class="container">' + $content + '</div></div><div style="flex-shrink:0;padding:1rem 2.5rem 1rem 0;"><img src="../images/' + $img + '" alt="" style="height:190px;width:auto;object-fit:contain;display:block;" /></div></div></section>'

    $c = [System.Text.RegularExpressions.Regex]::Replace($c, $pattern, $new)
    [System.IO.File]::WriteAllText($path, $c, [System.Text.Encoding]::UTF8)
    Write-Host "Updated: $p (image: $img)"
  } else {
    Write-Host "SKIPPED (pattern not found): $p"
  }
}
Write-Host "Done."
