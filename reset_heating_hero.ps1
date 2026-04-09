$pages = @('furnaces.html','boilers.html','combi-boiler.html','hot-water-tanks.html','tankless.html','rooftop.html','unit-heaters.html')

foreach ($p in $pages) {
  $path = "C:\Users\ryans\acecomfort-website\heating\$p"
  $c = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

  $pattern = '(?s)<section class="page-hero"[^>]*>.*?</section>'

  $match = [System.Text.RegularExpressions.Regex]::Match($c, $pattern, [System.Text.RegularExpressions.RegexOptions]::Singleline)

  if ($match.Success) {
    $inner = [System.Text.RegularExpressions.Regex]::Match($match.Value, '(?s)<ul class="breadcrumb">.*?</p>')
    $content = $inner.Value

    $new = '<section class="page-hero"><div class="container">' + $content + '</div></section>'

    $c = [System.Text.RegularExpressions.Regex]::Replace($c, $pattern, $new, [System.Text.RegularExpressions.RegexOptions]::Singleline)
    [System.IO.File]::WriteAllText($path, $c, [System.Text.Encoding]::UTF8)
    Write-Host "Reset: $p"
  } else {
    Write-Host "SKIPPED: $p"
  }
}
Write-Host "Done."
