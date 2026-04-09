$base = "C:\Users\ryans\acecomfort-website"
$files = Get-ChildItem -Path $base -Recurse -Filter "*.html"
$count = 0

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $new = $content.Replace(
        'Metro Vancouver &amp; Lower Mainland',
        'Metro Vancouver &amp; the Lower Mainland since 1995'
    )
    if ($new -ne $content) {
        [System.IO.File]::WriteAllText($file.FullName, $new, [System.Text.Encoding]::UTF8)
        $count++
        Write-Host ("Updated: " + $file.Name)
    }
}
Write-Host ("Done - " + $count + " files updated.")
