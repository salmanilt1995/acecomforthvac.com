Get-ChildItem -Path "C:\Users\ryans\acecomfort-website" -Recurse -Filter "*.html" | Where-Object { $_.Name -ne "specials.html" } | ForEach-Object {
  $content = [System.IO.File]::ReadAllText($_.FullName, [System.Text.Encoding]::UTF8)

  # For root-level pages
  $old1 = '<li class="nav-item"><a href="rebates.html" class="nav-link">Rebates</a></li>'
  $new1 = '<li class="nav-item"><a href="rebates.html" class="nav-link">Rebates</a></li><li class="nav-item"><a href="specials.html" class="nav-link" style="color:var(--orange);font-weight:700;">Specials</a></li>'

  # For subdirectory pages (heating/, air-conditioning/, etc.)
  $old2 = '<li class="nav-item"><a href="../rebates.html" class="nav-link">Rebates</a></li>'
  $new2 = '<li class="nav-item"><a href="../rebates.html" class="nav-link">Rebates</a></li><li class="nav-item"><a href="../specials.html" class="nav-link" style="color:var(--orange);font-weight:700;">Specials</a></li>'

  $new = $content.Replace($old1, $new1).Replace($old2, $new2)

  if ($new -ne $content) {
    [System.IO.File]::WriteAllText($_.FullName, $new, [System.Text.Encoding]::UTF8)
    Write-Host "Updated: $($_.Name)"
  }
}
Write-Host "Done."
