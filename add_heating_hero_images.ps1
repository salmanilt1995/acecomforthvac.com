$pages = @(
  @{ file = "furnaces.html";      image = "furnace.webp" },
  @{ file = "boilers.html";       image = "boiler.png" },
  @{ file = "combi-boiler.html";  image = "combi boiler.jpg" },
  @{ file = "hot-water-tanks.html"; image = "hot water tank.jpg" },
  @{ file = "tankless.html";      image = "tankless water heater.webp" },
  @{ file = "rooftop.html";       image = "rooftop unit.webp" },
  @{ file = "unit-heaters.html";  image = "unit heater.jpg" }
)

foreach ($page in $pages) {
  $path = "C:\Users\ryans\acecomfort-website\heating\$($page.file)"
  $img  = $page.image
  $content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

  # Match the plain page-hero section and wrap it with image on right
  $old = '<section class="page-hero"><div class="container">'
  $new = "<section class=""page-hero"" style=""position:relative;overflow:hidden;""><img src=""../images/$img"" alt="""" style=""position:absolute;right:0;top:0;height:100%;width:45%;object-fit:cover;object-position:center;z-index:0;"" /><div style=""position:absolute;inset:0;background:linear-gradient(90deg,rgba(10,22,45,0.97) 0%,rgba(10,22,45,0.90) 55%,rgba(10,22,45,0.15) 100%);z-index:1;""></div><div class=""container"" style=""position:relative;z-index:2;"">"

  if ($content -like "*$old*") {
    $content = $content.Replace($old, $new)
    [System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
    Write-Host "Updated: $($page.file)"
  } else {
    Write-Host "SKIPPED (pattern not found): $($page.file)"
  }
}
Write-Host "Done."
