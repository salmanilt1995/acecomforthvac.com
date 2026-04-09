$base = "C:\Users\ryans\acecomfort-website"
$files = Get-ChildItem -Path $base -Recurse -Filter "*.html"
$count = 0

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $new = $content.Replace('height:140px;overflow:hidden', 'height:220px;overflow:hidden').Replace('height:150px;overflow:hidden', 'height:220px;overflow:hidden').Replace('height:160px;overflow:hidden', 'height:220px;overflow:hidden').Replace('"height:140px;', '"height:220px;').Replace('"height:150px;', '"height:220px;').Replace('"height:160px;', '"height:220px;')
    if ($new -ne $content) {
        [System.IO.File]::WriteAllText($file.FullName, $new, [System.Text.Encoding]::UTF8)
        $count++
        Write-Host ("Updated: " + $file.Name)
    }
}
Write-Host ("Done - " + $count + " files updated.")
