# Fix booking-modal.js paths - subdirectories need ../js/ and locations need ../../js/
$root = "C:\Users\ryans\acecomfort-website"

$files = Get-ChildItem -Path $root -Filter "*.html" -Recurse | Where-Object {
  $_.Name -ne "contact.html" -and $_.Name -ne "specials.html" -and $_.Name -ne "membership.html"
}

foreach ($f in $files) {
  $c = [System.IO.File]::ReadAllText($f.FullName, [System.Text.Encoding]::UTF8)
  if ($c -notmatch 'booking-modal\.js') { continue }

  # Determine correct relative path based on directory depth
  $dir = $f.DirectoryName
  if ($dir -eq $root) {
    $correctPath = 'js/booking-modal.js'
  } elseif ($dir -like "*\locations\*" -or $dir -like "*\locations") {
    $correctPath = '../js/booking-modal.js'
  } else {
    $correctPath = '../js/booking-modal.js'
  }

  # Replace any incorrect path
  $updated = $c -replace 'src="[^"]*booking-modal\.js"', "src=`"$correctPath`""

  if ($updated -ne $c) {
    [System.IO.File]::WriteAllText($f.FullName, $updated, [System.Text.Encoding]::UTF8)
    Write-Host "Fixed: $($f.FullName.Replace($root + '\',''))"
  }
}
Write-Host "Done."
