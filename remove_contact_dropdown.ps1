# Remove Contact Us dropdown from all HTML files - only Services menu should have dropdown
$rootDir = "d:\xampp\htdocs\projects\acecomfort-website\acecomfort-website"
$htmlFiles = Get-ChildItem -Path $rootDir -Filter "*.html" -Recurse

$contactUsDropdown = @"
          <li class="nav-item">
            <a href="CONTACT_PATH" class="nav-link">Contact Us <span class="chevron">&#9660;</span></a>
            <div class="dropdown">
              <a href="ABOUT_PATH">About Us</a>
              <a href="LOCATIONS_PATH">Locations</a>
              <a href="BLOG_PATH">Blog</a>
              <a href="CONTACT_PATH">Contact</a>
            </div>
          </li>
"@

$contactUsLink = '          <li class="nav-item"><a href="CONTACT_PATH" class="nav-link">Contact Us</a></li>'

$filesUpdated = 0

foreach ($file in $htmlFiles) {
    if ($file.FullName -like "*_originals*" -or $file.Name -eq "index.html") { continue }
    
    $content = Get-Content -Path $file.FullName -Raw
    $originalContent = $content
    
    # Determine relative paths based on file depth
    $depth = ($file.FullName -replace [regex]::Escape($rootDir), '' -split '\\').Count - 2
    
    if ($depth -eq 1) {
        # Files in subdirectories like locations/, heating/, etc
        $contactPath = "../contact.html"
        $aboutPath = "../about.html"
        $locationsPath = "../locations.html"
        $blogPath = "../blog.html"
    }
    elseif ($depth -eq 2) {
        # Files in nested subdirectories like locations/city/
        $contactPath = "../../contact.html"
        $aboutPath = "../../about.html"
        $locationsPath = "../../locations.html"
        $blogPath = "../../blog.html"
    }
    else {
        # Root level
        $contactPath = "contact.html"
        $aboutPath = "about.html"
        $locationsPath = "locations.html"
        $blogPath = "blog.html"
    }
    
    # Try to remove the dropdown version and replace with simple link
    $pattern1 = [regex]::Escape('          <li class="nav-item">') + '\s*' +
                [regex]::Escape('<a href="' + $contactPath + '" class="nav-link">Contact Us <span class="chevron">') + '.*?' +
                [regex]::Escape('</div>') + '\s*' +
                [regex]::Escape('        </li>')
    
    if ($content -match $pattern1) {
        $replacement = '          <li class="nav-item"><a href="' + $contactPath + '" class="nav-link">Contact Us</a></li>'
        $content = $content -replace $pattern1, $replacement
        Set-Content -Path $file.FullName -Value $content
        Write-Host "Updated: $($file.Name)"
        $filesUpdated++
    }
}

Write-Host "`nTotal files updated: $filesUpdated"
