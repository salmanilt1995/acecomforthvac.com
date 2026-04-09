# Resize all hero image containers — larger for all, portrait container for tankless

$pages = @(
  @{ path="heating\combi-boiler.html";       w="400px"; h="320px" },
  @{ path="heating\hot-water-tanks.html";    w="280px"; h="400px" },
  @{ path="heating\tankless.html";           w="260px"; h="400px" },
  @{ path="heating\rooftop.html";            w="400px"; h="320px" },
  @{ path="heating\unit-heaters.html";       w="400px"; h="300px" },
  @{ path="air-conditioning\central.html";   w="400px"; h="320px" },
  @{ path="air-conditioning\ductless.html";  w="400px"; h="300px" },
  @{ path="heat-pumps\central.html";         w="380px"; h="340px" },
  @{ path="heat-pumps\ductless.html";        w="380px"; h="340px" },
  @{ path="heat-pumps\water-source.html";    w="380px"; h="340px" },
  @{ path="heating\furnaces.html";           w="400px"; h="300px" },
  @{ path="heating\boilers.html";            w="380px"; h="340px" }
)

foreach ($page in $pages) {
  $fullPath = "C:\Users\ryans\acecomfort-website\$($page.path)"
  $c = [System.IO.File]::ReadAllText($fullPath, [System.Text.Encoding]::UTF8)

  # Match the fixed-size image container div (old 320px width)
  $pattern = '(?s)<div style="flex-shrink:0;width:\d+px;height:\d+px;display:flex;align-items:center;justify-content:center;">'
  $new = '<div style="flex-shrink:0;width:' + $page.w + ';height:' + $page.h + ';display:flex;align-items:center;justify-content:center;">'

  $updated = [System.Text.RegularExpressions.Regex]::Replace($c, $pattern, $new)

  if ($updated -ne $c) {
    [System.IO.File]::WriteAllText($fullPath, $updated, [System.Text.Encoding]::UTF8)
    Write-Host "Updated: $($page.path)"
  } else {
    Write-Host "SKIPPED (no match): $($page.path)"
  }
}
Write-Host "Done."
