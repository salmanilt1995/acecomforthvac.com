Get-ChildItem -Path "C:\Users\ryans\acecomfort-website" -Recurse -Filter "*.html" | ForEach-Object {
  $content = [System.IO.File]::ReadAllText($_.FullName, [System.Text.Encoding]::UTF8)

  # Root-level pages
  $content = $content.Replace(
    '<li class="nav-item"></li><li class="nav-item"><a href="specials.html"',
    '<li class="nav-item"><a href="rebates.html" class="nav-link">Rebates</a></li><li class="nav-item"><a href="specials.html"'
  )

  # Subdirectory pages (../rebates.html)
  $content = $content.Replace(
    '<li class="nav-item"></li><li class="nav-item"><a href="../specials.html"',
    '<li class="nav-item"><a href="../rebates.html" class="nav-link">Rebates</a></li><li class="nav-item"><a href="../specials.html"'
  )

  [System.IO.File]::WriteAllText($_.FullName, $content, [System.Text.Encoding]::UTF8)
}
Write-Host "Done."
