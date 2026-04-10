$horizontalSub = [System.IO.File]::ReadAllText("d:\xampp\htdocs\projects\acecomforthvac.com\scratch\footer_horizontal_sub.html").Trim()
$horizontalRoot = [System.IO.File]::ReadAllText("d:\xampp\htdocs\projects\acecomforthvac.com\scratch\footer_horizontal_root.html").Trim()

$files = Get-ChildItem -Path "d:\xampp\htdocs\projects\acecomforthvac.com" -Recurse -Include *.html

foreach ($file in $files) {
    try {
        $filePath = $file.FullName
        $content = Get-Content $filePath -Raw
        
        $isLocationPage = ($filePath.Contains("\locations\") -or $file.Name -eq "locations.html")
        $targetSnippet = if ($filePath.Contains("\locations\")) { $horizontalSub } else { $horizontalRoot }

        $changed = $false

        # 1. REMOVE any old vertical city columns (Service Areas, Other Areas, Top Locations)
        $patterns = @(
            "(?s)<div class=""footer-col[^""]*""[^>]*>\s*<h4>Service Areas</h4>.*?</div>",
            "(?s)<div class=""footer-col[^""]*""[^>]*>\s*<h4>Other Areas</h4>.*?</div>",
            "(?s)<div class=""footer-col[^""]*""[^>]*>\s*<h4>Top Locations</h4>.*?</div>"
        )
        
        foreach ($p in $patterns) {
            if ($content -match $p) {
                $content = [Regex]::Replace($content, $p, "")
                $changed = $true
            }
        }

        # 2. UPDATE/INSERT Horizontal communities (Only for location pages)
        if ($content -match "(?s)<div class=""footer-communities"">.*?</div>") {
            $content = [Regex]::Replace($content, "(?s)<div class=""footer-communities"">.*?</div>", $targetSnippet)
            $changed = $true
        }
        elseif ($isLocationPage) {
            # Insert at the beginning of the footer container
            if ($content -match "(?s)(<footer[^>]*>\s*<div class=""container"">)") {
                $match = [Regex]::Match($content, "(?s)<footer[^>]*>\s*<div class=""container"">").Value
                $content = $content.Replace($match, $match + "`n" + $targetSnippet)
                $changed = $true
            }
        }

        if ($changed) {
            Set-Content $filePath $content -Encoding UTF8
            Write-Host "Fixed Footer: $filePath"
        }
    } catch {
        Write-Host "Error: $($file.FullName)"
    }
}
