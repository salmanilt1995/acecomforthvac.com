# Update all service page images with the new named photos

$base = "C:\Users\ryans\acecomfort-website"

# Each entry: file path, old image src, new image src
$replacements = @(
  # ---- furnaces.html ----
  @("heating\furnaces.html",      "Furnace-Repair.jpg",          "furnace service.jpg"),
  @("heating\furnaces.html",      "Fotolia_20056135_XS.jpg",     "furnace repair.jpg"),
  @("heating\furnaces.html",      "cover2.jpg",                  "furnace installtion.jpg"),

  # ---- boilers.html ----
  @("heating\boilers.html",       "Fotolia_20056135_XS.jpg",     "boiler service.jpeg"),
  @("heating\boilers.html",       "Fotolia_45832189_S.jpg",      "boiler repair.jpg"),
  @("heating\boilers.html",       "cover2.jpg",                  "boiler installation.jpeg"),

  # ---- tankless.html ----
  @("heating\tankless.html",      "Fotolia_20056135_XS.jpg",     "tankless water heater service.jpg"),
  @("heating\tankless.html",      "Fotolia_45832189_S.jpg",      "tankless repair.jpg"),
  @("heating\tankless.html",      "cover2.jpg",                  "tankless water heater installation.jpg"),

  # ---- combi-boiler.html ----
  @("heating\combi-boiler.html",  "Fotolia_20056135_XS.jpg",     "combi boiler service.webp"),
  @("heating\combi-boiler.html",  "Fotolia_45832189_S.jpg",      "Combi Boiler Repair.jpg"),
  @("heating\combi-boiler.html",  "cover2.jpg",                  "combi boiler installation.jpg"),

  # ---- hot-water-tanks.html ----
  @("heating\hot-water-tanks.html", "Fotolia_20056135_XS.jpg",   "hot water tank service.webp"),
  @("heating\hot-water-tanks.html", "Fotolia_45832189_S.jpg",    "hot water tank repair.jpg"),
  @("heating\hot-water-tanks.html", "cover2.jpg",                "hot water tank installation.jpg"),

  # ---- rooftop.html ----
  @("heating\rooftop.html",       "Commercial.jpg",              "rooftop unit service.jpg"),

  # ---- unit-heaters.html ----
  @("heating\unit-heaters.html",  "Commercial.jpg",              "unit heater service.jpg"),

  # ---- air-conditioning/central.html ----
  @("air-conditioning\central.html", "Fotolia_45832189_S.jpg",   "central ac service.webp"),
  @("air-conditioning\central.html", "Fotolia_20056135_XS.jpg",  "central ac reapir.avif"),
  @("air-conditioning\central.html", "Central-air-conditioner.jpg", "ac central installation.webp"),

  # ---- air-conditioning/ductless.html ----
  @("air-conditioning\ductless.html", "Fotolia_45832189_S.jpg",  "ductless air conditioning service.jpg"),
  @("air-conditioning\ductless.html", "Fotolia_20056135_XS.jpg", "ductless air conditioning repair.jpg"),
  @("air-conditioning\ductless.html", "ductless-AC.jpg",         "ductless air conditioning installation.webp"),

  # ---- heat-pumps/central.html ----
  @("heat-pumps\central.html",    "Fotolia_45832189_S.jpg",      "heat pump service.jpg"),
  @("heat-pumps\central.html",    "Fotolia_20056135_XS.jpg",     "heat pump repair.jpg"),
  @("heat-pumps\central.html",    "Central-air-conditioner.jpg", "heat pump installation.jpg"),

  # ---- heat-pumps/ductless.html ----
  @("heat-pumps\ductless.html",   "Fotolia_45832189_S.jpg",      "heat pump service.jpg"),
  @("heat-pumps\ductless.html",   "Fotolia_20056135_XS.jpg",     "heat pump repair.jpg"),
  @("heat-pumps\ductless.html",   "ductless-AC.jpg",             "ductless air conditioning installation.webp"),

  # ---- index.html (homepage service cards) ----
  @("index.html", "images/Fotolia_45832189_S.jpg`" alt=`"Heating services Vancouver", "images/furnace service.jpg`" alt=`"Heating services Vancouver"),
  @("index.html", "images/Central-air-conditioner.jpg`" alt=`"Air conditioning Vancouver", "images/ac central installation.webp`" alt=`"Air conditioning Vancouver"),
  @("index.html", "images/ductless-AC.jpg`" alt=`"Heat pump installation Vancouver", "images/heat pump installation.jpg`" alt=`"Heat pump installation Vancouver"),
  @("index.html", "images/Fotolia_20056135_XS.jpg`" alt=`"Air duct cleaning Vancouver", "images/Dryer Vent Cleaning Repair.jpg`" alt=`"Air duct cleaning Vancouver")
)

# Track which files we've already loaded
$fileCache = @{}

foreach ($r in $replacements) {
  $relPath = $r[0]
  $oldImg  = $r[1]
  $newImg  = $r[2]
  $path    = "$base\$relPath"

  if (-not $fileCache.ContainsKey($path)) {
    $fileCache[$path] = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
  }

  $before = $fileCache[$path]
  $fileCache[$path] = $fileCache[$path].Replace($oldImg, $newImg)

  if ($fileCache[$path] -ne $before) {
    Write-Host "  Replaced '$oldImg' -> '$newImg' in $relPath"
  } else {
    Write-Host "  WARN: '$oldImg' not found in $relPath"
  }
}

# Write all changed files
foreach ($path in $fileCache.Keys) {
  [System.IO.File]::WriteAllText($path, $fileCache[$path], [System.Text.Encoding]::UTF8)
  Write-Host "Saved: $path"
}

Write-Host "`nDone."
