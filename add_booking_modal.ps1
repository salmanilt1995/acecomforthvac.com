# Add booking-modal.js to all HTML files except contact.html, specials.html, membership.html
$root = "C:\Users\ryans\acecomfort-website"
$exclude = @("contact.html","specials.html","membership.html")

$files = Get-ChildItem -Path $root -Filter "*.html" -Recurse | Where-Object {
  $exclude -notcontains $_.Name
}

foreach ($f in $files) {
  $c = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)

  # Skip if already has booking-modal.js
  if ($c -match 'booking-modal\.js') { continue }

  # Determine relative path to js/booking-modal.js
  $rel = [System.IO.Path]::GetRelativePath($f.DirectoryName, $root).Replace('\','/')
  if ($rel -eq '.') {
    $scriptPath = 'js/booking-modal.js'
  } else {
    $scriptPath = "$rel/js/booking-modal.js"
  }

  # Insert before </body>
  $tag = "  <script src=`"$scriptPath`"></script>`n"
  $updated = $c -replace '</body>', "$tag</body>"

  if ($updated -ne $c) {
    [System.IO.File]::WriteAllText($f.FullName, $updated, [System.Text.Encoding]::UTF8)
    Write-Host "Added: $($f.FullName.Replace($root + '\',''))"
  }
}
Write-Host "Done."
