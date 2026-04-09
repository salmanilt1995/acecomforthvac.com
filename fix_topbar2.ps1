$base = "C:\Users\ryans\acecomfort-website"
$files = Get-ChildItem -Path $base -Recurse -Filter "*.html"
$count = 0

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $new = $content.Replace(
        'Mon&#8211;Sun: 24/7 Emergency Service Available',
        '24/7 Emergency Service'
    ).Replace(
        'Mon–Sun: 24/7 Emergency Service Available',
        '24/7 Emergency Service'
    ).Replace(
        'Mon&#8211;Sun: 24/7 Emergency Service',
        '24/7 Emergency Service'
    ).Replace(
        'Mon–Sun: 24/7 Emergency Service',
        '24/7 Emergency Service'
    )
    if ($new -ne $content) {
        [System.IO.File]::WriteAllText($file.FullName, $new, [System.Text.Encoding]::UTF8)
        $count++
        Write-Host ("Updated: " + $file.Name)
    }
}
Write-Host ("Done - " + $count + " files updated.")
