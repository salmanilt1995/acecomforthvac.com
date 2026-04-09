$base = "C:\Users\ryans\acecomfort-website"
$files = Get-ChildItem -Path $base -Filter "*.html"
$count = 0

$oldInline = '<a href="heating/repair.html">Heating Repair</a><a href="heating/service.html">Heating Service</a><a href="heating/installation.html">Heating Installation</a><a href="heating/furnaces.html">Furnaces</a><a href="heating/boilers.html">Boilers</a><a href="heating/hot-water-tanks.html">Hot Water Tanks</a><a href="heating/tankless.html">Tankless Water Heaters</a>'
$newInline = '<a href="heating/furnaces.html">Furnaces</a><a href="heating/boilers.html">Boilers</a><a href="heating/hot-water-tanks.html">Hot Water Tanks</a><a href="heating/tankless.html">Tankless Water Heaters</a><a href="heating/combi-boiler.html">Combi Boilers</a><a href="heating/rooftop.html">Rooftop Units</a><a href="heating/unit-heaters.html">Unit Heaters</a>'

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $new = $content.Replace($oldInline, $newInline)
    if ($new -ne $content) {
        [System.IO.File]::WriteAllText($file.FullName, $new, [System.Text.Encoding]::UTF8)
        $count++
        Write-Host ("Updated: " + $file.Name)
    }
}
Write-Host ("Done - " + $count + " files updated.")
