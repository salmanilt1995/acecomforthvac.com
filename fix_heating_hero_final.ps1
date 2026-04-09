$pages = @(
  @{ file="furnaces.html";        img="furnace-hero.png" },
  @{ file="boilers.html";         img="boiler-hero.png" },
  @{ file="combi-boiler.html";    img="combi boiler-hero.png" },
  @{ file="hot-water-tanks.html"; img="hot water tank-hero.png" },
  @{ file="tankless.html";        img="tankless water heater-hero.png" },
  @{ file="rooftop.html";         img="rooftop unit-hero.png" },
  @{ file="unit-heaters.html";    img="unit heater-hero.png" }
)

foreach ($page in $pages) {
  $path = "C:\Users\ryans\acecomfort-website\heating\$($page.file)"
  $c = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

  $pattern = '(?s)<section class="page-hero" style="padding:0;overflow:hidden;"><div style="display:flex;align-items:center;min-height:240px;"><div style="flex:1;padding:50px 0;"><div class="container">(.*?)</div></div><div style="flex-shrink:0;padding:0 2rem 0 0;display:flex;align-items:center;"><img src="\.\./images/[^"]+" alt="" style="height:230px;[^"]*" /></div></div></section>'

  $match = [System.Text.RegularExpressions.Regex]::Match($c, $pattern)

  if ($match.Success) {
    $content = $match.Groups[1].Value
    $img = $page.img

    $new = '<section class="page-hero" style="padding:0;overflow:hidden;"><div style="display:flex;align-items:center;min-height:280px;"><div style="flex:1;padding:55px 0;"><div class="container">' + $content + '</div></div><div style="flex-shrink:0;padding:0 2.5rem 0 0;display:flex;align-items:center;justify-content:center;"><img src="../images/' + $img + '" alt="" style="max-height:260px;max-width:280px;width:auto;height:auto;object-fit:contain;display:block;filter:drop-shadow(0 4px 20px rgba(0,0,0,0.5));" /></div></div></section>'

    $c = [System.Text.RegularExpressions.Regex]::Replace($c, $pattern, $new)
    [System.IO.File]::WriteAllText($path, $c, [System.Text.Encoding]::UTF8)
    Write-Host "Updated: $($page.file)"
  } else {
    Write-Host "SKIPPED: $($page.file)"
  }
}
Write-Host "Done."
