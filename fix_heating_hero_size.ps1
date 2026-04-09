$pages = @('furnaces.html','boilers.html','combi-boiler.html','hot-water-tanks.html','tankless.html','rooftop.html','unit-heaters.html')

foreach ($p in $pages) {
  $path = "C:\Users\ryans\acecomfort-website\heating\$p"
  $c = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

  # Add max-height to the section
  $c = $c.Replace(
    'class="page-hero" style="position:relative;overflow:hidden;"',
    'class="page-hero" style="position:relative;overflow:hidden;min-height:220px;max-height:280px;"'
  )

  # Reduce image width from 45% to 38% so it doesn't overwhelm the banner
  $c = $c.Replace(
    'style="position:absolute;right:0;top:0;height:100%;width:45%;object-fit:cover;object-position:center;z-index:0;"',
    'style="position:absolute;right:0;top:0;height:100%;width:38%;object-fit:cover;object-position:center;z-index:0;"'
  )

  [System.IO.File]::WriteAllText($path, $c, [System.Text.Encoding]::UTF8)
  Write-Host "Updated: $p"
}
Write-Host "Done."
