$replacements = @{
    "â€”" = "—"
    "âœ“" = "✓"
    "â€™" = "'"
    "â€“" = "–"
    "â€¢" = "•"
    "â€œ" = "“"
    "â€"  = "”"
    "Ã©"  = "é"
}

Write-Host "Starting project-wide encoding fix..."

$files = Get-ChildItem -Path "d:\xampp\htdocs\projects\acecomforthvac.com" -Recurse -Include *.html, *.css, *.js

foreach ($file in $files) {
    try {
        $filePath = $file.FullName
        # Reading with Default encoding to correctly interpret mojibake strings like 'â€”'
        $content = [System.IO.File]::ReadAllText($filePath, [System.Text.Encoding]::Default)
        
        $newContent = $content
        foreach ($old in $replacements.Keys) {
            $newContent = $newContent.Replace($old, $replacements[$old])
        }
        
        if ($newContent -ne $content) {
            # Save as UTF-8 without BOM
            $utf8NoBom = New-Object System.Text.UTF8Encoding $false
            [System.IO.File]::WriteAllText($filePath, $newContent, $utf8NoBom)
            Write-Host "Fixed: $filePath"
        }
    } catch {
        Write-Host "Error processing $($file.FullName): $_"
    }
}

Write-Host "Finished."
