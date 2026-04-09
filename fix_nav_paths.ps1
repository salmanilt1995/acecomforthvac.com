# Fix the mega-menu paths from ../service/index.html to ../service
$rootDir = "d:\xampp\htdocs\projects\acecomfort-website\acecomfort-website"
$htmlFiles = Get-ChildItem -Path $rootDir -Filter "*.html" -Recurse

$replacements = @(
    @{ old = '../heating/index.html/furnaces.html'; new = '../heating/furnaces.html' },
    @{ old = '../heating/index.html/boilers.html'; new = '../heating/boilers.html' },
    @{ old = '../heating/index.html/hot-water-tanks.html'; new = '../heating/hot-water-tanks.html' },
    @{ old = '../heating/index.html/tankless.html'; new = '../heating/tankless.html' },
    @{ old = '../heating/index.html/combi-boiler.html'; new = '../heating/combi-boiler.html' },
    @{ old = '../air-conditioning/index.html/central.html'; new = '../air-conditioning/central.html' },
    @{ old = '../air-conditioning/index.html/ductless.html'; new = '../air-conditioning/ductless.html' },
    @{ old = '../air-conditioning/index.html/installation.html'; new = '../air-conditioning/installation.html' },
    @{ old = '../air-conditioning/index.html/repair.html'; new = '../air-conditioning/repair.html' },
    @{ old = '../heat-pumps/index.html/central.html'; new = '../heat-pumps/central.html' },
    @{ old = '../heat-pumps/index.html/ductless.html'; new = '../heat-pumps/ductless.html' },
    @{ old = '../heat-pumps/index.html/water-source.html'; new = '../heat-pumps/water-source.html' },
    @{ old = '../heat-pumps/index.html/installation.html'; new = '../heat-pumps/installation.html' },
    @{ old = '../air-duct-cleaning/index.html/residential.html'; new = '../air-duct-cleaning/residential.html' },
    @{ old = '../air-duct-cleaning/index.html/commercial.html'; new = '../air-duct-cleaning/commercial.html' },
    @{ old = 'heating/index.html/furnaces.html'; new = 'heating/furnaces.html' },
    @{ old = 'heating/index.html/boilers.html'; new = 'heating/boilers.html' },
    @{ old = 'heating/index.html/hot-water-tanks.html'; new = 'heating/hot-water-tanks.html' },
    @{ old = 'heating/index.html/tankless.html'; new = 'heating/tankless.html' },
    @{ old = 'heating/index.html/combi-boiler.html'; new = 'heating/combi-boiler.html' },
    @{ old = 'air-conditioning/index.html/central.html'; new = 'air-conditioning/central.html' },
    @{ old = 'air-conditioning/index.html/ductless.html'; new = 'air-conditioning/ductless.html' },
    @{ old = 'air-conditioning/index.html/installation.html'; new = 'air-conditioning/installation.html' },
    @{ old = 'air-conditioning/index.html/repair.html'; new = 'air-conditioning/repair.html' },
    @{ old = 'heat-pumps/index.html/central.html'; new = 'heat-pumps/central.html' },
    @{ old = 'heat-pumps/index.html/ductless.html'; new = 'heat-pumps/ductless.html' },
    @{ old = 'heat-pumps/index.html/water-source.html'; new = 'heat-pumps/water-source.html' },
    @{ old = 'heat-pumps/index.html/installation.html'; new = 'heat-pumps/installation.html' },
    @{ old = 'air-duct-cleaning/index.html/residential.html'; new = 'air-duct-cleaning/residential.html' },
    @{ old = 'air-duct-cleaning/index.html/commercial.html'; new = 'air-duct-cleaning/commercial.html' }
)

$filesUpdated = 0
foreach ($file in $htmlFiles) {
    if ($file.FullName -like "*_originals*") { continue }
    
    $content = Get-Content -Path $file.FullName -Raw
    $originalContent = $content
    
    foreach ($replacement in $replacements) {
        $content = $content -replace [regex]::Escape($replacement.old), $replacement.new
    }
    
    if ($content -ne $originalContent) {
        Set-Content -Path $file.FullName -Value $content
        $filesUpdated++
    }
}

Write-Host "Fixed paths in $filesUpdated files"
