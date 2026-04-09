$base = "C:\Users\ryans\acecomfort-website"
$count = 0

$allFiles = Get-ChildItem -Path $base -Recurse -Filter "*.html"

foreach ($file in $allFiles) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $new = $content

    # Root pages - "heating/" prefix, Tankless Heaters variant
    $new = $new.Replace(
        '<a href="heating/repair.html">Heating Repair</a><a href="heating/service.html">Heating Service</a><a href="heating/installation.html">Heating Installation</a><a href="heating/furnaces.html">Furnaces</a><a href="heating/boilers.html">Boilers</a><a href="heating/hot-water-tanks.html">Hot Water Tanks</a><a href="heating/tankless.html">Tankless Heaters</a>',
        '<a href="heating/furnaces.html">Furnaces</a><a href="heating/boilers.html">Boilers</a><a href="heating/hot-water-tanks.html">Hot Water Tanks</a><a href="heating/tankless.html">Tankless Heaters</a><a href="heating/combi-boiler.html">Combi Boilers</a><a href="heating/rooftop.html">Rooftop Units</a><a href="heating/unit-heaters.html">Unit Heaters</a>'
    )
    # Root pages - "heating/" prefix, Tankless Water Heaters variant
    $new = $new.Replace(
        '<a href="heating/repair.html">Heating Repair</a><a href="heating/service.html">Heating Service</a><a href="heating/installation.html">Heating Installation</a><a href="heating/furnaces.html">Furnaces</a><a href="heating/boilers.html">Boilers</a><a href="heating/hot-water-tanks.html">Hot Water Tanks</a><a href="heating/tankless.html">Tankless Water Heaters</a>',
        '<a href="heating/furnaces.html">Furnaces</a><a href="heating/boilers.html">Boilers</a><a href="heating/hot-water-tanks.html">Hot Water Tanks</a><a href="heating/tankless.html">Tankless Water Heaters</a><a href="heating/combi-boiler.html">Combi Boilers</a><a href="heating/rooftop.html">Rooftop Units</a><a href="heating/unit-heaters.html">Unit Heaters</a>'
    )
    # Sub pages - "../heating/" prefix, Tankless Heaters variant
    $new = $new.Replace(
        '<a href="../heating/repair.html">Heating Repair</a><a href="../heating/service.html">Heating Service</a><a href="../heating/installation.html">Heating Installation</a><a href="../heating/furnaces.html">Furnaces</a><a href="../heating/boilers.html">Boilers</a><a href="../heating/hot-water-tanks.html">Hot Water Tanks</a><a href="../heating/tankless.html">Tankless Heaters</a>',
        '<a href="../heating/furnaces.html">Furnaces</a><a href="../heating/boilers.html">Boilers</a><a href="../heating/hot-water-tanks.html">Hot Water Tanks</a><a href="../heating/tankless.html">Tankless Heaters</a><a href="../heating/combi-boiler.html">Combi Boilers</a><a href="../heating/rooftop.html">Rooftop Units</a><a href="../heating/unit-heaters.html">Unit Heaters</a>'
    )

    if ($new -ne $content) {
        [System.IO.File]::WriteAllText($file.FullName, $new, [System.Text.Encoding]::UTF8)
        $count++
        Write-Host ("Updated: " + $file.Name)
    }
}
Write-Host ("Done - " + $count + " files updated.")
