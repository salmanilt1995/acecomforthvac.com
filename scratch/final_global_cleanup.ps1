# Explicitly use UTF-8 for everything
$utf8 = New-Object System.Text.UTF8Encoding $false

# Define common Mojibake clusters to wipe out
$replacements = @{
    "Ã¯Â¿Â½" = "&mdash;"
    "ï¿½"    = "&mdash;"
    "Ã¢â‚¬â€" = "&mdash;"
    "Ã¢â‚¬â„¢" = "'"
    "Ã¢â‚¬"   = "&mdash;"
    "Ã‚"      = ""
    "Ã"       = "&mdash;"
}

Write-Host "Starting project-wide Mojibake cleanup..."

$files = Get-ChildItem -Path "d:\xampp\htdocs\projects\acecomforthvac.com" -Recurse -Include *.html

foreach ($file in $files) {
    try {
        $filePath = $file.FullName
        $content = [System.IO.File]::ReadAllText($filePath, $utf8)
        
        $newContent = $content
        
        # Replace the specific clusters first
        foreach ($key in $replacements.Keys) {
            $newContent = $newContent.Replace($key, $replacements[$key])
        }
        
        # Also catch any raw high-bit characters that aren't common symbols/entities
        # But we must be careful not to kill emojis. 
        # For now, let's just do the specific clusters as they are the main issue.
        
        if ($newContent -ne $content) {
            [System.IO.File]::WriteAllText($filePath, $newContent, $utf8)
            Write-Host "Fixed: $filePath"
        }
    } catch {
        Write-Host "Error: $($file.FullName)"
    }
}

Write-Host "Cleanup complete."
