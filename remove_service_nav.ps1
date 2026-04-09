$root = (Get-Location).Path
Get-ChildItem -Path . -Filter "*.html" -Recurse | ForEach-Object {
    $filePath = $_.FullName
    $dir = Split-Path $filePath -Parent
    $relative = $dir.Replace($root, '').TrimStart('\/')
    $prefix = if ([string]::IsNullOrWhiteSpace($relative)) { '' } else { '../' }

    $nav = @"
        <ul class="nav-menu" id="navMenu">
          <li class="nav-item"><a href="${prefix}index.html" class="nav-link">Home</a></li>
          <li class="nav-item"><a href="${prefix}heating/index.html" class="nav-link">Heating</a></li>
          <li class="nav-item"><a href="${prefix}air-conditioning/index.html" class="nav-link">Air Conditioning</a></li>
          <li class="nav-item"><a href="${prefix}heat-pumps/index.html" class="nav-link">Heat Pumps</a></li>
          <li class="nav-item"><a href="${prefix}air-duct-cleaning/index.html" class="nav-link">Air Duct Cleaning</a></li>
          <li class="nav-item"><a href="${prefix}membership.html" class="nav-link">Membership</a></li>
          <li class="nav-item"><a href="${prefix}rebates.html" class="nav-link">Rebates</a></li>
          <li class="nav-item"><a href="${prefix}specials.html" class="nav-link" style="color:var(--orange);font-weight:700;">Specials</a></li>
          <li class="nav-item"><a href="${prefix}contact.html" class="nav-link">Contact Us</a></li>
        </ul>
"@

    $content = Get-Content -Path $filePath -Raw
    $pattern = '(?s)<ul class="nav-menu" id="navMenu">.*?</ul>'
    if ($content -match $pattern) {
        $updated = [regex]::Replace($content, $pattern, [System.Text.RegularExpressions.Regex]::Escape($nav) -replace '\\Q|\\E','', [System.Text.RegularExpressions.RegexOptions]::Singleline)
        Set-Content -Path $filePath -Value $updated -Encoding UTF8
        Write-Host "Updated: $filePath"
    } else {
        Write-Host "No nav found in: $filePath"
    }
}
