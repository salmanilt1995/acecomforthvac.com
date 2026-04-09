$insert = @"
  <link id="site-favicon" rel="icon" type="image/svg+xml" href="favicon.svg" />
  <script>
    (function() {
      const link = document.getElementById('site-favicon');
      const depth = Math.max(0, window.location.pathname.split('/').filter(Boolean).length - 2);
      if (link && depth > 0) {
        link.href = '../'.repeat(depth) + 'favicon.svg';
      }
    })();
  </script>
"@

Get-ChildItem -Path . -Recurse -Include *.html | ForEach-Object {
  $content = Get-Content $_.FullName -Raw
  if ($content -notmatch '<link rel="icon"') {
    if ($content -match '<link rel="canonical" href="[^"]+" ?/?>\r?\n') {
      $content = $content -replace '(<link rel="canonical" href="[^"]+" ?/?>\r?\n)', ('$1' + $insert)
    } else {
      $content = $content -replace '<head>', "<head>`r`n$insert"
    }
    Set-Content $_.FullName $content
    Write-Host "Updated favicon in $($_.FullName)"
  }
}