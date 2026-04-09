$cities = @(
  @{ name = "Vancouver";       slug = "vancouver" },
  @{ name = "Burnaby";         slug = "burnaby" },
  @{ name = "Surrey";          slug = "surrey" },
  @{ name = "Richmond";        slug = "richmond" },
  @{ name = "Coquitlam";       slug = "coquitlam" },
  @{ name = "North Vancouver"; slug = "north-vancouver" }
)

foreach ($city in $cities) {
  $n    = $city.name
  $path = "C:\Users\ryans\acecomfort-website\locations\$($city.slug).html"

  $newSection = @"
  <!-- Services in $n -->
  <section style="background:#fff;padding:2.5rem 0;border-bottom:1px solid var(--border);">
    <div class="container">
      <p style="font-size:0.7rem;font-weight:700;text-transform:uppercase;letter-spacing:0.1em;color:var(--mid-gray);margin-bottom:1.75rem;text-align:center;">All Services in $n</p>
      <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(190px,1fr));gap:2rem 3rem;">
        <div>
          <div style="font-size:0.65rem;font-weight:700;text-transform:uppercase;letter-spacing:0.1em;color:var(--green);border-bottom:2px solid var(--green);padding-bottom:0.4rem;margin-bottom:0.8rem;">Heat Pumps</div>
          <ul style="list-style:none;padding:0;margin:0;display:flex;flex-direction:column;gap:0.45rem;">
            <li><a href="$($city.slug)-heat-pump-installation.html" style="color:var(--dark-gray);text-decoration:none;font-size:0.875rem;line-height:1.4;">$n Heat Pump Installation</a></li>
            <li><a href="$($city.slug)-heat-pump-repair.html" style="color:var(--dark-gray);text-decoration:none;font-size:0.875rem;line-height:1.4;">$n Heat Pump Repair</a></li>
            <li><a href="$($city.slug)-heat-pump-service.html" style="color:var(--dark-gray);text-decoration:none;font-size:0.875rem;line-height:1.4;">$n Heat Pump Service</a></li>
          </ul>
        </div>
        <div>
          <div style="font-size:0.65rem;font-weight:700;text-transform:uppercase;letter-spacing:0.1em;color:var(--orange);border-bottom:2px solid var(--orange);padding-bottom:0.4rem;margin-bottom:0.8rem;">Heating</div>
          <ul style="list-style:none;padding:0;margin:0;display:flex;flex-direction:column;gap:0.45rem;">
            <li><a href="$($city.slug)-furnace-repair.html" style="color:var(--dark-gray);text-decoration:none;font-size:0.875rem;line-height:1.4;">$n Furnace Repair</a></li>
            <li><a href="$($city.slug)-furnace-installation.html" style="color:var(--dark-gray);text-decoration:none;font-size:0.875rem;line-height:1.4;">$n Furnace Installation</a></li>
            <li><a href="$($city.slug)-boiler-repair.html" style="color:var(--dark-gray);text-decoration:none;font-size:0.875rem;line-height:1.4;">$n Boiler Repair</a></li>
            <li><a href="$($city.slug)-boiler-installation.html" style="color:var(--dark-gray);text-decoration:none;font-size:0.875rem;line-height:1.4;">$n Boiler Installation</a></li>
            <li><a href="$($city.slug)-combi-boiler.html" style="color:var(--dark-gray);text-decoration:none;font-size:0.875rem;line-height:1.4;">$n Combi Boiler</a></li>
            <li><a href="$($city.slug)-tankless-water-heater.html" style="color:var(--dark-gray);text-decoration:none;font-size:0.875rem;line-height:1.4;">$n Tankless Water Heater</a></li>
          </ul>
        </div>
        <div>
          <div style="font-size:0.65rem;font-weight:700;text-transform:uppercase;letter-spacing:0.1em;color:#0ea5e9;border-bottom:2px solid #0ea5e9;padding-bottom:0.4rem;margin-bottom:0.8rem;">Air Conditioning</div>
          <ul style="list-style:none;padding:0;margin:0;display:flex;flex-direction:column;gap:0.45rem;">
            <li><a href="$($city.slug)-central-ac-installation.html" style="color:var(--dark-gray);text-decoration:none;font-size:0.875rem;line-height:1.4;">$n Central AC Installation</a></li>
            <li><a href="$($city.slug)-ductless-ac-installation.html" style="color:var(--dark-gray);text-decoration:none;font-size:0.875rem;line-height:1.4;">$n Ductless AC Installation</a></li>
            <li><a href="$($city.slug)-air-conditioning-repair.html" style="color:var(--dark-gray);text-decoration:none;font-size:0.875rem;line-height:1.4;">$n Air Conditioning Repair</a></li>
            <li><a href="$($city.slug)-ac-service.html" style="color:var(--dark-gray);text-decoration:none;font-size:0.875rem;line-height:1.4;">$n AC Service &amp; Maintenance</a></li>
          </ul>
        </div>
        <div>
          <div style="font-size:0.65rem;font-weight:700;text-transform:uppercase;letter-spacing:0.1em;color:var(--navy);border-bottom:2px solid var(--navy);padding-bottom:0.4rem;margin-bottom:0.8rem;">More Services</div>
          <ul style="list-style:none;padding:0;margin:0;display:flex;flex-direction:column;gap:0.45rem;">
            <li><a href="$($city.slug)-air-duct-cleaning.html" style="color:var(--dark-gray);text-decoration:none;font-size:0.875rem;line-height:1.4;">$n Air Duct Cleaning</a></li>
            <li><a href="../contact.html" style="color:var(--orange);text-decoration:none;font-size:0.875rem;font-weight:600;line-height:1.4;">$n Emergency HVAC &mdash; 24/7</a></li>
          </ul>
        </div>
      </div>
    </div>
  </section>
"@

  $html = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

  # If section already exists, replace it. Otherwise insert after page-hero.
  if ($html -match '<!-- Services in') {
    $html = [System.Text.RegularExpressions.Regex]::Replace(
      $html,
      '(?s)<!-- Services in [^-]+-+>\s*<section[^>]*>.*?</section>',
      $newSection.Trim()
    )
  } else {
    $html = [System.Text.RegularExpressions.Regex]::Replace(
      $html,
      '(?s)(<section class="page-hero">.*?</section>)',
      "`$1`n`n  $($newSection.Trim())"
    )
  }

  [System.IO.File]::WriteAllText($path, $html, [System.Text.Encoding]::UTF8)
  Write-Host "Updated: $path"
}

Write-Host "Done."
