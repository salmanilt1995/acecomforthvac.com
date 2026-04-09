# Fix Specials href - should link to specials.html
$rootDir = "d:\xampp\htdocs\projects\acecomfort-website\acecomfort-website"

Get-ChildItem -Path $rootDir -Filter "*.html" -Recurse | Where-Object { 
    $_.FullName -notlike "*_originals*" 
} | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    $originalContent = $content
    
    # Fix specials.html links
    if ($_.FullName -like "*locations*") {
        $content = $content -replace '<a href=""\s+class="nav-link"\s+style="color:var\(--orange\);font-weight:700;">', '<a href="../specials.html" class="nav-link" style="color:var(--orange);font-weight:700;">'
    }
    elseif ($_.FullName -like "*heating*" -or $_.FullName -like "*air-conditioning*" -or $_.FullName -like "*heat-pumps*" -or $_.FullName -like "*air-duct-cleaning*") {
        $content = $content -replace '<a href=""\s+class="nav-link"\s+style="color:var\(--orange\);font-weight:700;">', '<a href="../specials.html" class="nav-link" style="color:var(--orange);font-weight:700;">'
    }
    else {
        $content = $content -replace '<a href=""\s+class="nav-link"\s+style="color:var\(--orange\);font-weight:700;">', '<a href="specials.html" class="nav-link" style="color:var(--orange);font-weight:700;">'
    }
    
    if ($content -ne $originalContent) {
        Set-Content -Path $_.FullName -Value $content
        Write-Host "Fixed: $($_.Name)"
    }
}

Write-Host "Done!"
