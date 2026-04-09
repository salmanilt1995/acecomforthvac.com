Get-ChildItem -Path "C:\Users\ryans\acecomfort-website" -Recurse -Filter "*.html" | ForEach-Object {
  $content = [System.IO.File]::ReadAllText($_.FullName, [System.Text.Encoding]::UTF8)

  $new = [System.Text.RegularExpressions.Regex]::Replace(
    $content,
    '<div class="top-bar-right"><a href="[^"]*rebates\.html"[^>]*>.*?</a></div>',
    ''
  )

  # Also catch variations like the index.html inline style version
  $new = [System.Text.RegularExpressions.Regex]::Replace(
    $new,
    '<a href="[^"]*rebates\.html"[^>]*>[^<]*(?:Rebates|rebates)[^<]*</a>',
    ''
  )

  if ($new -ne $content) {
    [System.IO.File]::WriteAllText($_.FullName, $new, [System.Text.Encoding]::UTF8)
    Write-Host "Updated: $($_.Name)"
  }
}
Write-Host "Done."
