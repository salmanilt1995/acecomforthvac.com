$files = Get-ChildItem -Recurse "C:\Users\ryans\acecomfort-website" -Filter "*.html" | Select-Object -ExpandProperty FullName
$count = 0

foreach ($f in $files) {
    $content = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
    $orig = $content

    # ── ROOT-LEVEL PAGES: air-conditioning/ prefix ──────────────────────────────
    # AC dropdown (inline)
    $content = $content.Replace(
        '<a href="air-conditioning/repair.html">AC Repair</a><a href="air-conditioning/service.html">AC Service</a><a href="air-conditioning/installation.html">AC Installation</a><a href="air-conditioning/central.html">Central AC</a><a href="air-conditioning/ductless.html">Ductless AC</a>',
        '<a href="air-conditioning/central.html">Central AC</a><a href="air-conditioning/ductless.html">Ductless AC</a>'
    )
    # HP dropdown (inline)
    $content = $content.Replace(
        '<a href="heat-pumps/repair.html">HP Repair</a><a href="heat-pumps/service.html">HP Service</a><a href="heat-pumps/installation.html">HP Installation</a><a href="heat-pumps/central.html">Central</a><a href="heat-pumps/ductless.html">Ductless</a><a href="heat-pumps/water-source.html">Water Source</a>',
        '<a href="heat-pumps/central.html">Central Heat Pumps</a><a href="heat-pumps/ductless.html">Ductless Heat Pumps</a><a href="heat-pumps/water-source.html">Water Source</a>'
    )

    # ── SUBDIR PAGES: ../air-conditioning/ prefix ────────────────────────────────
    # AC dropdown (inline)
    $content = $content.Replace(
        '<a href="../air-conditioning/repair.html">AC Repair</a><a href="../air-conditioning/service.html">AC Service</a><a href="../air-conditioning/installation.html">AC Installation</a><a href="../air-conditioning/central.html">Central AC</a><a href="../air-conditioning/ductless.html">Ductless AC</a>',
        '<a href="../air-conditioning/central.html">Central AC</a><a href="../air-conditioning/ductless.html">Ductless AC</a>'
    )
    # HP dropdown with "HP" prefix
    $content = $content.Replace(
        '<a href="../heat-pumps/repair.html">HP Repair</a><a href="../heat-pumps/service.html">HP Service</a><a href="../heat-pumps/installation.html">HP Installation</a><a href="../heat-pumps/central.html">Central</a><a href="../heat-pumps/ductless.html">Ductless</a><a href="../heat-pumps/water-source.html">Water Source</a>',
        '<a href="../heat-pumps/central.html">Central Heat Pumps</a><a href="../heat-pumps/ductless.html">Ductless Heat Pumps</a><a href="../heat-pumps/water-source.html">Water Source</a>'
    )
    # HP dropdown with "Heat Pump" prefix (AC subpages use this wording)
    $content = $content.Replace(
        '<a href="../heat-pumps/repair.html">Heat Pump Repair</a><a href="../heat-pumps/service.html">Heat Pump Service</a><a href="../heat-pumps/installation.html">Heat Pump Installation</a><a href="../heat-pumps/central.html">Central</a><a href="../heat-pumps/ductless.html">Ductless</a><a href="../heat-pumps/water-source.html">Water Source</a>',
        '<a href="../heat-pumps/central.html">Central Heat Pumps</a><a href="../heat-pumps/ductless.html">Ductless Heat Pumps</a><a href="../heat-pumps/water-source.html">Water Source</a>'
    )

    # ── AC SUBPAGES: relative paths (multi-line block) ───────────────────────────
    $content = $content.Replace(
        "          <a href=""repair.html"">AC Repair</a>`r`n          <a href=""service.html"">AC Service</a>`r`n          <a href=""installation.html"">AC Installation</a>`r`n          <a href=""central.html"">Central AC</a>`r`n          <a href=""ductless.html"">Ductless AC</a>",
        "          <a href=""central.html"">Central AC</a>`r`n          <a href=""ductless.html"">Ductless AC</a>"
    )

    # ── HP SUBPAGES: relative paths ──────────────────────────────────────────────
    # HP subpages own dropdown (relative)
    $content = $content.Replace(
        '<a href="repair.html">HP Repair</a><a href="service.html">HP Service</a><a href="installation.html">HP Installation</a><a href="central.html">Central Heat Pumps</a><a href="ductless.html">Ductless Heat Pumps</a><a href="water-source.html">Water Source Heat Pumps</a>',
        '<a href="central.html">Central Heat Pumps</a><a href="ductless.html">Ductless Heat Pumps</a><a href="water-source.html">Water Source Heat Pumps</a>'
    )

    if ($content -ne $orig) {
        [System.IO.File]::WriteAllText($f, $content, [System.Text.Encoding]::UTF8)
        $count++
        Write-Host "Updated: $f"
    }
}
Write-Host "Done - $count files updated."
