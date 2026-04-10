$files = Get-ChildItem -Path "d:\xampp\htdocs\projects\acecomforthvac.com\heating\*.html"
foreach ($file in $files) {
    $filePath = $file.FullName
    $content = Get-Content $filePath -Raw
    # Replace non-ASCII clusters with a clean dash. 
    # This cleans up the Ã¯Â¿Â½ and other mojibake clusters.
    $newContent = [Regex]::Replace($content, "[^\x00-\x7F]+", " &mdash; ")
    
    # Special fix: if we accidentally replaced &#128197; etc, we might have broken them.
    # But those are ASCII mostly. 
    
    if ($newContent -ne $content) {
        Set-Content $filePath $newContent -Encoding UTF8
        Write-Host "Cleaned: $filePath"
    }
}
