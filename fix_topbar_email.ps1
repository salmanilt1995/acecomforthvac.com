$email = '<div class="top-bar-right"><a href="mailto:info@acecomfort.ca" style="color:#f47328;font-weight:600;">&#9993; info@acecomfort.ca</a></div>'

Get-ChildItem -Path "C:\Users\ryans\acecomfort-website" -Recurse -Filter "*.html" | ForEach-Object {
  $content = [System.IO.File]::ReadAllText($_.FullName, [System.Text.Encoding]::UTF8)

  # Replace any top-bar-right block (single line) with the email version
  $new = [System.Text.RegularExpressions.Regex]::Replace(
    $content,
    '<div class="top-bar-right">.*?</div>',
    $email
  )

  if ($new -ne $content) {
    [System.IO.File]::WriteAllText($_.FullName, $new, [System.Text.Encoding]::UTF8)
    Write-Host "Updated: $($_.Name)"
  }
}
Write-Host "Done."
