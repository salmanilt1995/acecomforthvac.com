$greenPhone = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#16a34a" width="1em" height="1em" style="vertical-align:-0.15em;flex-shrink:0;"><path d="M6.62 10.79a15.05 15.05 0 0 0 6.59 6.59l2.2-2.2a1 1 0 0 1 1.01-.24 11.47 11.47 0 0 0 3.58.57 1 1 0 0 1 1 1V20a1 1 0 0 1-1 1A17 17 0 0 1 3 4a1 1 0 0 1 1-1h3.5a1 1 0 0 1 1 1c0 1.25.2 2.45.57 3.58a1 1 0 0 1-.25 1.01l-2.2 2.2z"/></svg>'

Get-ChildItem -Path "C:\Users\ryans\acecomfort-website" -Recurse -Filter "*.html" | ForEach-Object {
  $content = [System.IO.File]::ReadAllText($_.FullName, [System.Text.Encoding]::UTF8)
  $new = $content.Replace("&#128222;", $greenPhone)
  if ($new -ne $content) {
    [System.IO.File]::WriteAllText($_.FullName, $new, [System.Text.Encoding]::UTF8)
    Write-Host "Updated: $($_.Name)"
  }
}
Write-Host "Done."
