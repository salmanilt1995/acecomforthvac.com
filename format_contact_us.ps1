# Fix Contact Us and Specials line breaks across all pages
$rootDir = "d:\xampp\htdocs\projects\acecomfort-website\acecomfort-website"

Get-ChildItem -Path $rootDir -Filter "*.html" -Recurse | Where-Object { 
    $_.FullName -notlike "*_originals*" -and $_.Name -ne "index.html" 
} | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    $originalContent = $content
    
    # Add line break before Specials
    $content = $content -replace '</li><li class="nav-item"><a href="([^"]*specials\.html)"', "</li>`n          <li class=`"nav-item`"><a href=`"$1`""
    
    # Add line break before Contact Us
    $content = $content -replace '(Specials</a></li>)<li class="nav-item"><a href="([^"]*contact\.html)"', "`$1`n          <li class=`"nav-item`"><a href=`"`$2`""
    
    # Alternative: if Contact Us appears after Rebates
    $content = $content -replace '(Rebates</a></li>)<li class="nav-item"><a href="([^"]*contact\.html)"', "`$1`n          <li class=`"nav-item`"><a href=`"`$2`""
    
    if ($content -ne $originalContent) {
        Set-Content -Path $_.FullName -Value $content
        Write-Host "Updated: $($_.Name)"
    }
}

Write-Host "Complete!"
