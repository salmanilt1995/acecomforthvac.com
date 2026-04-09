$pages = @(
  @{ path="heating\combi-boiler.html";       img="updated combi boiler.png";              prefix="../" },
  @{ path="heating\hot-water-tanks.html";    img="updated hot water tank.png";            prefix="../" },
  @{ path="heating\tankless.html";           img="updated tankless water heater.png";     prefix="../" },
  @{ path="heating\rooftop.html";            img="updated rooftop unit.png";              prefix="../" },
  @{ path="heating\unit-heaters.html";       img="updated unit heater.png";               prefix="../" },
  @{ path="air-conditioning\central.html";   img="updated central ac.png";               prefix="../" },
  @{ path="air-conditioning\ductless.html";  img="updated ductless ac.png";              prefix="../" },
  @{ path="heat-pumps\central.html";         img="central_heat_pump-removebg-preview.png"; prefix="../" },
  @{ path="heat-pumps\ductless.html";        img="updated ductless heatpump.png";         prefix="../" },
  @{ path="heat-pumps\water-source.html";    img="updated water source heat pump.png";    prefix="../" }
)

foreach ($page in $pages) {
  $fullPath = "C:\Users\ryans\acecomfort-website\$($page.path)"
  $c = [System.IO.File]::ReadAllText($fullPath, [System.Text.Encoding]::UTF8)

  # Match the plain hero: <section class="page-hero"><div class="container">CONTENT</div></section>
  $pattern = '(?s)<section class="page-hero"><div class="container">(.*?)</div></section>'
  $match = [System.Text.RegularExpressions.Regex]::Match($c, $pattern)

  if ($match.Success) {
    $content = $match.Groups[1].Value.Trim()
    $img = $page.img
    $pre = $page.prefix

    $new = '<section class="page-hero" style="padding:0;overflow:hidden;">
    <div style="display:flex;align-items:center;min-height:280px;max-width:1200px;margin:0 auto;padding:0 2.5rem;">
      <div style="flex:1;padding:50px 3rem 50px 0;">
        ' + $content + '
      </div>
      <div style="flex-shrink:0;width:320px;height:240px;display:flex;align-items:center;justify-content:center;">
        <img src="' + $pre + 'images/' + $img + '" alt="" style="width:100%;height:100%;object-fit:contain;display:block;" />
      </div>
    </div>
  </section>'

    $c = [System.Text.RegularExpressions.Regex]::Replace($c, $pattern, $new, [System.Text.RegularExpressions.RegexOptions]::Singleline)
    [System.IO.File]::WriteAllText($fullPath, $c, [System.Text.Encoding]::UTF8)
    Write-Host "Updated: $($page.path)"
  } else {
    Write-Host "SKIPPED: $($page.path)"
  }
}
Write-Host "Done."
