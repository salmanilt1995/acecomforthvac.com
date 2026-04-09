$base = "C:\Users\ryans\acecomfort-website"
$files = Get-ChildItem -Path $base -Recurse -Filter "*.html"
$count = 0

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $new = $content.Replace(
        'https://fonts.googleapis.com/css2?family=Montserrat:wght@600;700;800&family=Open+Sans:wght@400;500;600&display=swap',
        'https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;600;700;800&display=swap'
    )
    if ($new -ne $content) {
        [System.IO.File]::WriteAllText($file.FullName, $new, [System.Text.Encoding]::UTF8)
        $count++
        Write-Host ("Updated: " + $file.Name)
    }
}
Write-Host ("Done - " + $count + " files updated.")
