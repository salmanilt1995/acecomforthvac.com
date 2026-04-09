# Update Contact Us in all HTML files - remove the chevron since it's not a dropdown
$rootDir = "d:\xampp\htdocs\projects\acecomfort-website\acecomfort-website"

Get-ChildItem -Path $rootDir -Filter "*.html" -Recurse | Where-Object { 
    $_.FullName -notlike "*_originals*" -and $_.Name -ne "index.html"
} | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    $originalContent = $content
    
    # Remove chevron from Contact Us if it exists, and ensure proper formatting
    $content = $content -replace '<a href="([^"]*contact\.html)"[^>]*>Contact Us <span class="chevron">[^<]*</span></a>', '<a href="$1" class="nav-link">Contact Us</a>'
    
    if ($content -ne $originalContent) {
        Set-Content -Path $_.FullName -Value $content
        Write-Host "Updated: $($_.Name)"
    }
}

Write-Host "Complete!"
