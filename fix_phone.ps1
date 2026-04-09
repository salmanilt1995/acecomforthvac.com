$base = "C:\Users\ryans\acecomfort-website"
$files = Get-ChildItem -Path $base -Recurse -Filter "*.html"
$count = 0

foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    $new = $content.Replace('6045550100', '6046363939').Replace('(604) 555-0100', '(604) 636-3939').Replace('604-555-0100', '604-636-3939')
    if ($new -ne $content) {
        [System.IO.File]::WriteAllText($file.FullName, $new, [System.Text.Encoding]::UTF8)
        $count++
        Write-Host ("Updated: " + $file.Name)
    }
}
Write-Host ("Done - " + $count + " files updated.")
