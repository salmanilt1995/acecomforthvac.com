# Update all remaining HTML pages to have Services mega-menu
# This handles service detail pages like furnaces.html, central.html, etc.

$rootDir = "d:\xampp\htdocs\projects\acecomfort-website\acecomfort-website"
$htmlFiles = Get-ChildItem -Path $rootDir -Filter "*.html" -Recurse | Where-Object { $_.Name -ne "index.html" -and $_.FullName -notlike "*_originals*" }

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

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw
    $originalContent = $content
    $fileChanged = $false
    
    # Skip files that already have mega-column
    if ($content -like "*mega-column*") { continue }
    
    # Determine file depth and construct paths
    $depth = ($file.FullName -replace [regex]::Escape($rootDir), '' -split '\\').Count - 2
    
    if ($depth -eq 1) {
        $heatingLink = "../heating/index.html"
        $acLink = "../air-conditioning/index.html"
        $hpLink = "../heat-pumps/index.html"
        $adcLink = "../air-duct-cleaning/index.html"
    }
    elseif ($depth -eq 2) {
        $heatingLink = "../../heating/index.html"
        $acLink = "../../air-conditioning/index.html"
        $hpLink = "../../heat-pumps/index.html"
        $adcLink = "../../air-duct-cleaning/index.html"
    }
    else {
        $heatingLink = "heating/index.html"
        $acLink = "air-conditioning/index.html"
        $hpLink = "heat-pumps/index.html"
        $adcLink = "air-duct-cleaning/index.html"
    }
    
    # Pattern 1: Old 4-separate-menu structure with classic dropdowns
    if ($content -match '<li class="nav-item"><a href="[^"]*heating/index\.html"[^>]*>Heating' -and 
        $content -match '<li class="nav-item"><a href="[^"]*air-conditioning/index\.html"[^>]*>Air Conditioning' -and
        $content -match '<li class="nav-item"><a href="[^"]*heat-pumps/index\.html"[^>]*>Heat Pumps' -and
        $content -match '<li class="nav-item"><a href="[^"]*air-duct-cleaning/index\.html"[^>]*>Air Duct Cleaning') {
        
        # Replace with mega-menu
        $newMegaMenu = $megaMenuTemplate -replace 'HEATING_LINK', $heatingLink -replace 'AC_LINK', $acLink -replace 'HP_LINK', $hpLink -replace 'ADC_LINK', $adcLink
        
        # Try to match the exact pattern with line breaks (flexible)
        $oldPattern = '(?s)<li class="nav-item"><a href="[^"]*heating.*?\n.*?</li>.*?<li class="nav-item"><a href="[^"]*air-conditioning.*?\n.*?</li>.*?<li class="nav-item"><a href="[^"]*heat-pumps.*?\n.*?</li>.*?<li class="nav-item"><a href="[^"]*air-duct-cleaning.*?\n.*?</li>'
        
        if ($content -match $oldPattern) {
            $content = $content -replace $oldPattern, $newMegaMenu
            $fileChanged = $true
        }
    }
    
    # Pattern 2: Simple list (no menus at all - like in service detail pages)
    elseif ($content -match '<li class="nav-item"><a href="[^"]*heating/index\.html"[^>]*>Heating</a></li>' -and 
            $content -match '<li class="nav-item"><a href="[^"]*air-conditioning/index\.html"[^>]*>Air Conditioning</a></li>' -and
            $content -match '<li class="nav-item"><a href="[^"]*heat-pumps/index\.html"[^>]*>Heat Pumps</a></li>') {
        
        $newMegaMenu = $megaMenuTemplate -replace 'HEATING_LINK', $heatingLink -replace 'AC_LINK', $acLink -replace 'HP_LINK', $hpLink -replace 'ADC_LINK', $adcLink
        
        # Match and replace the 4 simple links
        $oldPattern = '<li class="nav-item"><a href="[^"]*heating/index\.html"[^>]*>Heating</a></li>\s*<li class="nav-item"><a href="[^"]*air-conditioning/index\.html"[^>]*>Air Conditioning</a></li>\s*<li class="nav-item"><a href="[^"]*heat-pumps/index\.html"[^>]*>Heat Pumps</a></li>\s*<li class="nav-item"><a href="[^"]*air-duct-cleaning/index\.html"[^>]*>Air Duct Cleaning</a></li>'
        
        if ($content -match $oldPattern) {
            $content = $content -replace $oldPattern, $newMegaMenu
            $fileChanged = $true
        }
    }
    
    # Remove any remaining Contact Us dropdowns
    $contactDropdownPattern = '<li class="nav-item"><a href="([^"]*contact\.html)"[^>]*>Contact Us <span class="chevron">.*?</div>\s*</li>'
    if ($content -match $contactDropdownPattern) {
        $contactLink = $matches[1]
        $replacement = "<li class=""nav-item""><a href=""$contactLink"" class=""nav-link"">Contact Us</a></li>"
        $content = $content -replace $contactDropdownPattern, $replacement
        $fileChanged = $true
    }
    
    if ($fileChanged -and $content -ne $originalContent) {
        Set-Content -Path $file.FullName -Value $content
        Write-Host "✓ $($file.FullName -replace [regex]::Escape($rootDir), '')"
        $filesUpdated++
    }
}

Write-Host "`n✓ Complete! Updated $filesUpdated files"
