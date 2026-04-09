$phoneDiv = '<div class="top-bar-right"><a href="tel:6046363939" style="color:#f47328;font-weight:700;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="#16a34a" width="1em" height="1em" style="vertical-align:-0.15em;flex-shrink:0;"><path d="M6.62 10.79a15.05 15.05 0 0 0 6.59 6.59l2.2-2.2a1 1 0 0 1 1.01-.24 11.47 11.47 0 0 0 3.58.57 1 1 0 0 1 1 1V20a1 1 0 0 1-1 1A17 17 0 0 1 3 4a1 1 0 0 1 1-1h3.5a1 1 0 0 1 1 1c0 1.25.2 2.45.57 3.58a1 1 0 0 1-.25 1.01l-2.2 2.2z"/></svg> (604) 636-3939</a></div>'

Get-ChildItem -Path "C:\Users\ryans\acecomfort-website" -Recurse -Filter "*.html" | ForEach-Object {
  $content = [System.IO.File]::ReadAllText($_.FullName, [System.Text.Encoding]::UTF8)

  # Skip pages that already have top-bar-right
  if ($content -like '*top-bar-right*') {
    return
  }

  # Find the top-bar-left closing and insert top-bar-right before the container/top-bar closes
  $old = '<span>&#127757; Metro Vancouver</span></div></div></div>'
  $new = '<span>&#127757; Metro Vancouver</span></div>' + $phoneDiv + '</div></div>'

  if ($content -like "*$old*") {
    $content = $content.Replace($old, $new)
    [System.IO.File]::WriteAllText($_.FullName, $content, [System.Text.Encoding]::UTF8)
    Write-Host "Updated: $($_.Name)"
    return
  }

  # Try alternate left content (some pages say "Metro Vancouver & the Lower Mainland since 1995")
  $old2 = 'Metro Vancouver &amp; the Lower Mainland since 1995</span></div></div></div>'
  $new2 = 'Metro Vancouver &amp; the Lower Mainland since 1995</span></div>' + $phoneDiv + '</div></div>'

  if ($content -like "*$old2*") {
    $content = $content.Replace($old2, $new2)
    [System.IO.File]::WriteAllText($_.FullName, $content, [System.Text.Encoding]::UTF8)
    Write-Host "Updated: $($_.Name)"
  }
}
Write-Host "Done."
