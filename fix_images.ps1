$base = "C:\Users\ryans\acecomfort-website"

# ---- heat-pumps/index.html ----
$f = "$base\heat-pumps\index.html"
$c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
$c = $c.Replace('https://picsum.photos/seed/central-heat-pump/400/140', '../images/Central-air-conditioner.jpg')
$c = $c.Replace('https://picsum.photos/seed/ductless-mini-split/400/140', '../images/ductless-AC.jpg')
$c = $c.Replace('https://picsum.photos/seed/water-source-hp/400/140', '../images/Fotolia_20056135_XS.jpg')
[System.IO.File]::WriteAllText($f, $c, [System.Text.Encoding]::UTF8)
Write-Host "Updated: heat-pumps/index.html"

# ---- locations.html ----
$f = "$base\locations.html"
$c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
$c = $c.Replace('https://picsum.photos/seed/vancouver-city/600/360', 'images/Commercial.jpg')
$c = $c.Replace('https://picsum.photos/seed/surrey-bc-suburb/600/360', 'images/Fotolia_45832189_S.jpg')
$c = $c.Replace('https://picsum.photos/seed/burnaby-homes/600/360', 'images/cover2.jpg')
$c = $c.Replace('https://picsum.photos/seed/richmond-bc-residential/600/360', 'images/Central-air-conditioner.jpg')
$c = $c.Replace('https://picsum.photos/seed/coquitlam-bc-suburb/600/360', 'images/Fotolia_20056135_XS.jpg')
$c = $c.Replace('https://picsum.photos/seed/north-vancouver-mountains/600/360', 'images/ductless-AC.jpg')
[System.IO.File]::WriteAllText($f, $c, [System.Text.Encoding]::UTF8)
Write-Host "Updated: locations.html"

# ---- blog.html ----
$f = "$base\blog.html"
$c = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
$c = $c.Replace('https://picsum.photos/seed/rebate-money/400/200', 'images/Commercial.jpg')
$c = $c.Replace('https://picsum.photos/seed/air-duct-clean/400/200', 'images/Fotolia_20056135_XS.jpg')
$c = $c.Replace('https://picsum.photos/seed/furnace-repair/400/200', 'images/Fotolia_45832189_S.jpg')
$c = $c.Replace('https://picsum.photos/seed/ac-cooling/400/200', 'images/Central-air-conditioner.jpg')
$c = $c.Replace('https://picsum.photos/seed/hvac-checklist/400/200', 'images/cover2.jpg')
$c = $c.Replace('https://picsum.photos/seed/water-heater/400/200', 'images/Fotolia_20056135_XS.jpg')
$c = $c.Replace('https://picsum.photos/seed/radiant-floor/400/200', 'images/Fotolia_45832189_S.jpg')
$c = $c.Replace('https://picsum.photos/seed/hvac-membership/400/200', 'images/cover2.jpg')
$c = $c.Replace('https://picsum.photos/seed/smart-hvac-tech/400/200', 'images/Commercial.jpg')
[System.IO.File]::WriteAllText($f, $c, [System.Text.Encoding]::UTF8)
Write-Host "Updated: blog.html"

Write-Host "Done."
