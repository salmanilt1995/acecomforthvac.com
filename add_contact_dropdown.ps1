# Add Contact Us dropdown to all pages
$rootDir = "d:\xampp\htdocs\projects\acecomfort-website\acecomfort-website"

Get-ChildItem -Path $rootDir -Filter "*.html" -Recurse | Where-Object { 
    $_.FullName -notlike "*_originals*" -and $_.Name -ne "index.html"
} | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    $originalContent = $content
    
    # Determine file depth for relative paths
    if ($_.FullName -like "*\locations\*") {
        $aboutLink = "../about.html"
        $locLink = "../locations.html"
        $blogLink = "../blog.html"
        $contactLink = "../contact.html"
    }
    elseif ($_.FullName -like "*\air-conditioning\*" -or $_.FullName -like "*\heating\*" -or $_.FullName -like "*\heat-pumps\*" -or $_.FullName -like "*\air-duct-cleaning\*") {
        $aboutLink = "../about.html"
        $locLink = "../locations.html"
        $blogLink = "../blog.html"
        $contactLink = "../contact.html"
    }
    else {
        $aboutLink = "about.html"
        $locLink = "locations.html"
        $blogLink = "blog.html"
        $contactLink = "contact.html"
    }
    
    # Find and replace Contact Us link
    $oldPattern = '<li class="nav-item"><a href="([^"]*contact\.html)"[^>]*>Contact Us</a></li>'
    
    if ($content -match $oldPattern) {
        $replacement = @"
          <li class="nav-item">
            <a href="$contactLink" class="nav-link">Contact Us <span class="chevron">&#9660;</span></a>
            <div class="dropdown" style="grid-template-columns: 1fr; width: 200px;">
              <a href="$aboutLink">About Us</a>
              <a href="$locLink">Locations</a>
              <a href="$blogLink">Blog</a>
              <a href="$contactLink">Contact</a>
            </div>
          </li>
"@
        
        $content = [regex]::Replace($content, $oldPattern, $replacement)
        Set-Content -Path $_.FullName -Value $content
        Write-Host "Updated: $($_.Name)"
    }
}

Write-Host "Complete!"
