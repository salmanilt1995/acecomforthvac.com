# Simple direct replacement for all remaining service detail pages
$rootDir = "d:\xampp\htdocs\projects\acecomfort-website\acecomfort-website"

# Old patterns to patterns updated
$replacements = @(
    # Pattern: Simple service links (no dropdowns) - replace with mega-menu
    @{
        pattern = '<li class="nav-item"><a href="([^"]*heating/index\.html)"[^>]*>Heating</a></li>\s*<li class="nav-item"><a href="([^"]*air-conditioning/index\.html)"[^>]*>Air Conditioning</a></li>\s*<li class="nav-item"><a href="([^"]*heat-pumps/index\.html)"[^>]*>Heat Pumps</a></li>\s*<li class="nav-item"><a href="([^"]*air-duct-cleaning/index\.html)"[^>]*>Air Duct Cleaning</a></li>'
        createReplacement = {
            param($matches)
            $heating = $matches.Groups[1].Value
            $ac = $matches.Groups[2].Value
            $hp = $matches.Groups[3].Value
            $adc = $matches.Groups[4].Value
@"
      <li class="nav-item">
        <a href="$heating" class="nav-link">Services <span class="chevron">&#9660;</span></a>
        <div class="dropdown">
          <div class="mega-column">
            <a href="$heating">Heating</a>
            <a href="${heating}furnaces.html">Furnaces</a>
            <a href="${heating}boilers.html">Boilers</a>
            <a href="${heating}hot-water-tanks.html">Hot Water Tanks</a>
            <a href="${heating}tankless.html">Tankless Water</a>
            <a href="${heating}combi-boiler.html">Combi Boilers</a>
          </div>
          <div class="mega-column">
            <a href="$ac">Air Conditioning</a>
            <a href="${ac}central.html">Central AC</a>
            <a href="${ac}ductless.html">Ductless AC</a>
            <a href="${ac}installation.html">Installation</a>
            <a href="${ac}repair.html">Repair</a>
          </div>
          <div class="mega-column">
            <a href="$hp">Heat Pumps</a>
            <a href="${hp}central.html">Central Heat Pumps</a>
            <a href="${hp}ductless.html">Ductless Heat Pumps</a>
            <a href="${hp}water-source.html">Water Source</a>
            <a href="${hp}installation.html">Installation</a>
          </div>
          <div class="mega-column">
            <a href="$adc">Air Duct Cleaning</a>
            <a href="${adc}residential.html">Residential</a>
            <a href="${adc}commercial.html">Commercial</a>
          </div>
        </div>
      </li>
"@
        }
    }
)

$htmlFiles = Get-ChildItem -Path $rootDir -Filter "*.html" -Recurse | Where-Object { $_.FullName -notlike "*_originals*" -and $_.Name -ne "furnaces.html" }

$updateCount = 0

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw
    
    # Skip if already has mega-column
    if ($content -like "*mega-column*") { continue }
    
    foreach ($rep in $replacements) {
        if ($content -match $rep.pattern) {
            $matches = [regex]::Match($content, $rep.pattern)
            if ($matches.Success) {
                $replacement = & $rep.createReplacement $matches
                $newContent = $content -replace $rep.pattern, $replacement
                Set-Content -Path $file.FullName -Value $newContent
                Write-Host "✓ $($file.Name)"
                $updateCount++
                break
            }
        }
    }
}

Write-Host "`nUpdated $updateCount files"
