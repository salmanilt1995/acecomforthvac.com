# Update navigation to single Services mega-menu across all HTML files
# This script replaces the 4 separate nav items (Heating, Air Conditioning, Heat Pumps, Air Duct Cleaning)
# with a single "Services" item containing a mega-menu with 4 columns

$rootDir = "d:\xampp\htdocs\projects\acecomfort-website\acecomfort-website"
$htmlFiles = Get-ChildItem -Path $rootDir -Filter "*.html" -Recurse

# New consolidated mega-menu structure
$newNav = @'
          <li class="nav-item">
            <a href="HEATING_PATH" class="nav-link">Services <span class="chevron">&#9660;</span></a>
            <div class="dropdown">
              <div class="mega-column">
                <a href="HEATING_PATH" style="font-weight:700; color:var(--navy); font-size:0.95rem; padding-top:0;">Heating</a>
                <a href="HEATING_PATH/furnaces.html">Furnaces</a>
                <a href="HEATING_PATH/boilers.html">Boilers</a>
                <a href="HEATING_PATH/hot-water-tanks.html">Hot Water Tanks</a>
                <a href="HEATING_PATH/tankless.html">Tankless Water</a>
                <a href="HEATING_PATH/combi-boiler.html">Combi Boilers</a>
              </div>
              <div class="mega-column">
                <a href="AC_PATH" style="font-weight:700; color:var(--navy); font-size:0.95rem; padding-top:0;">Air Conditioning</a>
                <a href="AC_PATH/central.html">Central AC</a>
                <a href="AC_PATH/ductless.html">Ductless AC</a>
                <a href="AC_PATH/installation.html">Installation</a>
                <a href="AC_PATH/repair.html">Repair</a>
              </div>
              <div class="mega-column">
                <a href="HP_PATH" style="font-weight:700; color:var(--navy); font-size:0.95rem; padding-top:0;">Heat Pumps</a>
                <a href="HP_PATH/central.html">Central Heat Pumps</a>
                <a href="HP_PATH/ductless.html">Ductless Heat Pumps</a>
                <a href="HP_PATH/water-source.html">Water Source</a>
                <a href="HP_PATH/installation.html">Installation</a>
              </div>
              <div class="mega-column">
                <a href="ADC_PATH" style="font-weight:700; color:var(--navy); font-size:0.95rem; padding-top:0;">Air Duct Cleaning</a>
                <a href="ADC_PATH/residential.html">Residential</a>
                <a href="ADC_PATH/commercial.html">Commercial</a>
              </div>
            </div>
          </li>
'@

# Pattern to find old 4 separate nav items
$oldPattern = '(?s)<li class="nav-item">\s*<a href="[^"]*heating/index\.html"[^>]*>Heating.*?</li>\s*<li class="nav-item">\s*<a href="[^"]*air-conditioning/index\.html"[^>]*>Air Conditioning.*?</li>\s*<li class="nav-item">\s*<a href="[^"]*heat-pumps/index\.html"[^>]*>Heat Pumps.*?</li>\s*<li class="nav-item">\s*<a href="[^"]*air-duct-cleaning/index\.html"[^>]*>Air Duct Cleaning.*?</li>'

$filesUpdated = 0
$filesSkipped = 0

foreach ($file in $htmlFiles) {
    # Skip if file is in _originals
    if ($file.FullName -like "*_originals*") { continue }
    
    $content = Get-Content -Path $file.FullName -Raw
    
    # Determine relative paths based on file location
    if ($file.FullName -like "*\locations\*") {
        # Files in locations subdirectory
        $heatingPath = "../heating/index.html"
        $acPath = "../air-conditioning/index.html"
        $hpPath = "../heat-pumps/index.html"
        $adcPath = "../air-duct-cleaning/index.html"
    }
    elseif ($file.FullName -like "*\air-conditioning\*" -or $file.FullName -like "*\heating\*" -or $file.FullName -like "*\heat-pumps\*" -or $file.FullName -like "*\air-duct-cleaning\*") {
        # Files in service subdirectories
        $heatingPath = "heating/index.html"
        $acPath = "air-conditioning/index.html"
        $hpPath = "heat-pumps/index.html"
        $adcPath = "air-duct-cleaning/index.html"
    }
    else {
        # Root level files
        $heatingPath = "heating/index.html"
        $acPath = "air-conditioning/index.html"
        $hpPath = "heat-pumps/index.html"
        $adcPath = "air-duct-cleaning/index.html"
    }
    
    # Build the replacement text with proper relative paths
    $replacement = $newNav -replace "HEATING_PATH", $heatingPath -replace "AC_PATH", $acPath -replace "HP_PATH", $hpPath -replace "ADC_PATH", $adcPath
    
    # Try to find and replace the old pattern
    if ($content -match $oldPattern) {
        $newContent = $content -replace $oldPattern, $replacement
        Set-Content -Path $file.FullName -Value $newContent
        Write-Host "Updated: $($file.Name)"
        $filesUpdated++
    }
    else {
        # Check if file already has the new structure
        if ($content -like '*<a href="*" class="nav-link">Services*') {
            Write-Host "Skipped (already updated): $($file.Name)"
        }
        else {
            Write-Host "Skipped (no match): $($file.Name)"
        }
        $filesSkipped++
    }
}

Write-Host "`nSummary:"
Write-Host "Files Updated: $filesUpdated"
Write-Host "Files Skipped: $filesSkipped"
Write-Host "Total Processed: $($filesUpdated + $filesSkipped)"
