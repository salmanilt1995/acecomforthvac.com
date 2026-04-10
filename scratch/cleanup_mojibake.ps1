$utf8 = New-Object System.Text.UTF8Encoding $false

$replacements = @{
    "â€”" = "&mdash;"
    "â€“" = "&ndash;"
    "â€™" = "'"
    "Ã¯Â¿Â½" = "&mdash;"
    "Ã¢â‚¬â€" = "&mdash;"
    "Ã¢â‚¬â„" = "&mdash;"
    "AA" = "&mdash;"
    "AAYA A-" = "Smart Service"
}

Write-Host "Cleaning up Mojibake..."

$files = Get-ChildItem -Path "d:\xampp\htdocs\projects\acecomforthvac.com" -Recurse -Include *.html, *.css, *.js

foreach ($file in $files) {
    try {
        $filePath = $file.FullName
        $content = [System.IO.File]::ReadAllText($filePath, $utf8)
        
        $newContent = $content
        foreach ($key in $replacements.Keys) {
            $newContent = $newContent.Replace($key, $replacements[$key])
        }
        
        if ($newContent -ne $content) {
            [System.IO.File]::WriteAllText($filePath, $newContent, $utf8)
            Write-Host "Repaired: $filePath"
        }
    } catch {
        Write-Host "Error processing $($file.FullName): $_"
    }
}
