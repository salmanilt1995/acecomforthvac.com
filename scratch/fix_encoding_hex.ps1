$latin1 = [System.Text.Encoding]::GetEncoding("iso-8859-1")
$utf8 = [System.Text.Encoding]::UTF8

# Mojibake sequences commonly seen:
# E2 80 94 (UTF-8 em dash) read as Latin-1 results in â€”
$emDashMojibake = $latin1.GetString(@(0xE2, 0x80, 0x94))
$checkMojibake = $latin1.GetString(@(0xE2, 0x9C, 0x93))
$apostropheMojibake = $latin1.GetString(@(0xE2, 0x80, 0x99))

Write-Host "Searching and fixing Mojibake..."

$files = Get-ChildItem -Path "d:\xampp\htdocs\projects\acecomforthvac.com" -Recurse -Include *.html, *.css, *.js

foreach ($file in $files) {
    try {
        $filePath = $file.FullName
        # Read as Latin-1 to capture the exact mojibake bytes
        $content = [System.IO.File]::ReadAllText($filePath, $latin1)
        
        $newContent = $content
        $newContent = $newContent.Replace($emDashMojibake, "&mdash;")
        $newContent = $newContent.Replace($checkMojibake, "&#10003;")
        $newContent = $newContent.Replace($apostropheMojibake, "'")
        
        if ($newContent -ne $content) {
            # Save properly as UTF-8 (no BOM)
            $utf8NoBom = New-Object System.Text.UTF8Encoding $false
            [System.IO.File]::WriteAllText($filePath, $newContent, $utf8NoBom)
            Write-Host "Fixed: $filePath"
        }
    } catch {
        Write-Host "Error processing $($file.FullName): $_"
    }
}
