$email = '<div class="top-bar-right"><a href="mailto:info@acecomforthvac.com" style="color:#fff;font-weight:600;">&#9993; info@acecomforthvac.com</a></div>'

Get-ChildItem -Path "C:\Users\ryans\acecomfort-website" -Recurse -Filter "*.html" | ForEach-Object {
  $content = [System.IO.File]::ReadAllText($_.FullName, [System.Text.Encoding]::UTF8)
  $original = $content

  # Replace existing top-bar-right blocks with correct version
  $content = [System.Text.RegularExpressions.Regex]::Replace(
    $content,
    '<div class="top-bar-right">.*?</div>',
    $email
  )

  # Add top-bar-right if still missing (pages that had no top-bar-right at all)
  if ($content -notlike '*top-bar-right*') {
    $content = $content.Replace(
      'Metro Vancouver &amp; the Lower Mainland since 1995</span></div></div></div>',
      'Metro Vancouver &amp; the Lower Mainland since 1995</span></div>' + $email + '</div></div>'
    )
    $content = $content.Replace(
      '<span>&#127757; Metro Vancouver</span></div></div></div>',
      '<span>&#127757; Metro Vancouver</span></div>' + $email + '</div></div>'
    )
  }

  if ($content -ne $original) {
    [System.IO.File]::WriteAllText($_.FullName, $content, [System.Text.Encoding]::UTF8)
    Write-Host "Updated: $($_.Name)"
  }
}
Write-Host "Done."

