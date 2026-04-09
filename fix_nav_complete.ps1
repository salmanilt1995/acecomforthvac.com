# Comprehensive navigation update:
# 1. Replace 4 separate service menus with Services mega-menu
# 2. Remove Contact Us dropdowns
# 3. Ensure only Services has a submenu

$rootDir = "d:\xampp\htdocs\projects\acecomfort-website\acecomfort-website"
$htmlFiles = Get-ChildItem -Path $rootDir -Filter "*.html" -Recurse

# New consolidated mega-menu structure
$megaMenuTemplate = @'
          <li class="nav-item">
            <a href="HEATING_LINK" class="nav-link">Services <span class="chevron">&#9660;</span></a>
            <div class="dropdown">
              <div class="mega-column">
                <a href="HEATING_LINK">Heating</a>
                <a href="HEATING_LINK/furnaces.html">Furnaces</a>
                <a href="HEATING_LINK/boilers.html">Boilers</a>
                <a href="HEATING_LINK/hot-water-tanks.html">Hot Water Tanks</a>
                <a href="HEATING_LINK/tankless.html">Tankless Water</a>
                <a href="HEATING_LINK/combi-boiler.html">Combi Boilers</a>
              </div>
              <div class="mega-column">
                <a href="AC_LINK">Air Conditioning</a>
                <a href="AC_LINK/central.html">Central AC</a>
                <a href="AC_LINK/ductless.html">Ductless AC</a>
                <a href="AC_LINK/installation.html">Installation</a>
                <a href="AC_LINK/repair.html">Repair</a>
              </div>
              <div class="mega-column">
                <a href="HP_LINK">Heat Pumps</a>
                <a href="HP_LINK/central.html">Central Heat Pumps</a>
                <a href="HP_LINK/ductless.html">Ductless Heat Pumps</a>
                <a href="HP_LINK/water-source.html">Water Source</a>
                <a href="HP_LINK/installation.html">Installation</a>
              </div>
              <div class="mega-column">
                <a href="ADC_LINK">Air Duct Cleaning</a>
                <a href="ADC_LINK/residential.html">Residential</a>
                <a href="ADC_LINK/commercial.html">Commercial</a>
              </div>
            </div>
          </li>
'@

$filesUpdated = 0
$filesWithOldMenu = @()

foreach ($file in $htmlFiles) {
    if ($file.FullName -like "*_originals*" -or $file.Name -eq "index.html") { continue }
    
    $content = Get-Content -Path $file.FullName -Raw
    $originalContent = $content
    $fileChanged = $false
    
    # Determine relative paths based on file location
    if ($file.FullName -like "*\air-conditioning\*") {
        $heatingLink = "../heating/index.html"
        $acLink = "index.html"
        $hpLink = "../heat-pumps/index.html"
        $adcLink = "../air-duct-cleaning/index.html"
        $contactLink = "../contact.html"
    }
    elseif ($file.FullName -like "*\heat-pumps\*") {
        $heatingLink = "../heating/index.html"
        $acLink = "../air-conditioning/index.html"
        $hpLink = "index.html"
        $adcLink = "../air-duct-cleaning/index.html"
        $contactLink = "../contact.html"
    }
    elseif ($file.FullName -like "*\heating\*") {
        $heatingLink = "index.html"
        $acLink = "../air-conditioning/index.html"
        $hpLink = "../heat-pumps/index.html"
        $adcLink = "../air-duct-cleaning/index.html"
        $contactLink = "../contact.html"
    }
    elseif ($file.FullName -like "*\air-duct-cleaning\*") {
        $heatingLink = "../heating/index.html"
        $acLink = "../air-conditioning/index.html"
        $hpLink = "../heat-pumps/index.html"
        $adcLink = "index.html"
        $contactLink = "../contact.html"
    }
    elseif ($file.FullName -like "*\locations\*") {
        $heatingLink = "../heating/index.html"
        $acLink = "../air-conditioning/index.html"
        $hpLink = "../heat-pumps/index.html"
        $adcLink = "../air-duct-cleaning/index.html"
        $contactLink = "../contact.html"
    }
    else {
        $heatingLink = "heating/index.html"
        $acLink = "air-conditioning/index.html"
        $hpLink = "heat-pumps/index.html"
        $adcLink = "air-duct-cleaning/index.html"
        $contactLink = "contact.html"
    }
    
    # Check if file has old 4-separate-menu structure
    if ($content -match '<a href="[^"]*heating/index\.html"[^>]*>Heating' -and 
        $content -match '<a href="[^"]*air-conditioning/index\.html"[^>]*>Air Conditioning' -and
        $content -match '<a href="[^"]*heat-pumps/index\.html"[^>]*>Heat Pumps' -and
        $content -match '<a href="[^"]*air-duct-cleaning/index\.html"[^>]*>Air Duct Cleaning') {
        
        # Try to find and replace old structure
        $oldPattern = '(?s)<li class="nav-item">\s*<a href="[^"]*heating/index\.html"[^>]*>Heating.*?</li>\s*<li class="nav-item">\s*<a href="[^"]*air-conditioning/index\.html"[^>]*>Air Conditioning.*?</li>\s*<li class="nav-item">\s*<a href="[^"]*heat-pumps/index\.html"[^>]*>Heat Pumps.*?</li>\s*<li class="nav-item">\s*<a href="[^"]*air-duct-cleaning/index\.html"[^>]*>Air Duct Cleaning.*?</li>'
        
        if ($content -match $oldPattern) {
            $replacement = $megaMenuTemplate -replace 'HEATING_LINK', $heatingLink -replace 'AC_LINK', $acLink -replace 'HP_LINK', $hpLink -replace 'ADC_LINK', $adcLink
            $content = $content -replace $oldPattern, $replacement
            $fileChanged = $true
        }
    }
    
    # Remove Contact Us dropdown everywhere
    $contactDropdownPattern = '\s*<li class="nav-item">\s*<a href="[^"]*contact\.html"[^>]*>Contact Us <span class="chevron">.*?</div>\s*</li>'
    if ($content -match $contactDropdownPattern) {
        $contactLink = $content | Select-String -Pattern 'href="([^"]*contact\.html)"' | ForEach-Object { $_.Matches[0].Groups[1].Value } | Select-Object -First 1
        $replacement = "`n          <li class="nav-item"><a href=""`"$contactLink`"" class="nav-link">Contact Us</a></li>"
        $content = $content -replace $contactDropdownPattern, $replacement
        $fileChanged = $true
    }
    
    if ($fileChanged) {
        Set-Content -Path $file.FullName -Value $content
        Write-Host "✓ Updated: $($file.Name)"
        $filesUpdated++
    }
}

Write-Host "`n✓ Navigation update complete!"
Write-Host "Files updated: $filesUpdated"
