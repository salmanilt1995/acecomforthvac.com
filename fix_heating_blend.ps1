$pages = @(
  @{ file="furnaces.html";        img="furnace.webp" },
  @{ file="boilers.html";         img="boiler.png" },
  @{ file="combi-boiler.html";    img="combi boiler.jpg" },
  @{ file="hot-water-tanks.html"; img="hot water tank.jpg" },
  @{ file="tankless.html";        img="tankless water heater.webp" },
  @{ file="rooftop.html";         img="rooftop unit.webp" },
  @{ file="unit-heaters.html";    img="unit heater.jpg" }
)

foreach ($page in $pages) {
  $path = "C:\Users\ryans\acecomfort-website\heating\$($page.file)"
  $c = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

  # Match any current hero variant and replace cleanly
  $pattern = '(?s)<section class="page-hero"[^>]*>.*?</section>'

  $match = [System.Text.RegularExpressions.Regex]::Match($c, $pattern)

  if ($match.Success) {
    # Extract inner content (breadcrumb + h1 + p)
    $inner = [System.Text.RegularExpressions.Regex]::Match($match.Value, '(?s)<ul class="breadcrumb">.*?</p>')
    $content = $inner.Value

    $img = $page.img

    $new = '<section class="page-hero" style="padding:0;overflow:hidden;"><div style="display:flex;align-items:center;min-height:280px;"><div style="flex:1;padding:55px 0;"><div class="container">' + $content + '</div></div><div style="flex-shrink:0;padding:0 2.5rem 0 0;display:flex;align-items:center;"><img src="../images/' + $img + '" alt="" style="max-height:260px;max-width:300px;width:auto;height:auto;display:block;mix-blend-mode:multiply;" /></div></div></section>'

    $c = [System.Text.RegularExpressions.Regex]::Replace($c, $pattern, $new, [System.Text.RegularExpressions.RegexOptions]::Singleline)
    [System.IO.File]::WriteAllText($path, $c, [System.Text.Encoding]::UTF8)
    Write-Host "Updated: $($page.file)"
  } else {
    Write-Host "SKIPPED: $($page.file)"
  }
}
Write-Host "Done."
