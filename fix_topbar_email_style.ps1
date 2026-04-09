Get-ChildItem -Path "C:\Users\ryans\acecomfort-website" -Recurse -Filter "*.html" | ForEach-Object {
  $content = [System.IO.File]::ReadAllText($_.FullName, [System.Text.Encoding]::UTF8)
  $new = $content.Replace(
    '<div class="top-bar-right"><a href="mailto:info@acecomfort.ca" style="color:#fff;font-weight:600;">&#9993; info@acecomfort.ca</a></div>',
    '<div class="top-bar-right"><a href="mailto:info@acecomfort.ca">&#9993; info@acecomfort.ca</a></div>'
  )
  if ($new -ne $content) {
    [System.IO.File]::WriteAllText($_.FullName, $new, [System.Text.Encoding]::UTF8)
    Write-Host "Updated: $($_.Name)"
  }
}
Write-Host "Done."
