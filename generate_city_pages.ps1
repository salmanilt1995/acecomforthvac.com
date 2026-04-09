# Generate city location pages for AceComfort
$cities = @(
  @{ name="West Vancouver"; slug="west-vancouver"; neighborhoods="Ambleside, Dundarave, Horseshoe Bay, Caulfeild, and the British Properties"; desc="West Vancouver's luxury homes and hillside properties demand HVAC specialists with real experience. AceComfort has been serving North Shore homeowners since 1995 — from high-efficiency heat pump upgrades to emergency furnace repairs in the British Properties." },
  @{ name="Port Coquitlam"; slug="port-coquitlam"; neighborhoods="Citadel, Mary Hill, Oxford Heights, Lincoln Park, and Downtown Port Coquitlam"; desc="Port Coquitlam is one of the fastest-growing communities in the Tri-Cities. Whether you're in a newer subdivision or an older established home, AceComfort provides fast, reliable HVAC service across all of PoCo." },
  @{ name="Port Moody"; slug="port-moody"; neighborhoods="Inlet Centre, Heritage Mountain, Moody Centre, Glenayre, and College Park"; desc="Port Moody's mix of waterfront condos, hillside homes, and new developments requires versatile HVAC expertise. AceComfort technicians serve all Port Moody neighbourhoods with same-day availability." },
  @{ name="New Westminster"; slug="new-westminster"; neighborhoods="Sapperton, Queens Park, Queensborough, Uptown, Downtown, and Connaught Heights"; desc="New Westminster's historic homes and newer high-rises have very different heating and cooling needs. AceComfort has served the Royal City since 1995, handling everything from heritage home boiler replacements to ductless mini-split installs in modern condos." },
  @{ name="Ladner"; slug="ladner"; neighborhoods="Ladner Village, Boundary Bay, Tilbury, and South Delta"; desc="Ladner's quiet residential streets and waterfront properties deserve reliable HVAC service. AceComfort provides full heating, cooling, and heat pump services throughout Ladner and South Delta." },
  @{ name="Tsawwassen"; slug="tsawwassen"; neighborhoods="Tsawwassen Springs, Beach Grove, English Bluff, and Boundary Bay"; desc="Tsawwassen homeowners trust AceComfort for heat pump installations, furnace replacements, and air conditioning service. We serve all Tsawwassen neighbourhoods with fast response and expert technicians." },
  @{ name="Horseshoe Bay"; slug="horseshoe-bay"; neighborhoods="Horseshoe Bay Village, Gleneagles, and Eagle Harbour"; desc="Horseshoe Bay and Gleneagles homes face unique marine climate demands. AceComfort installs cold-climate heat pumps and high-efficiency heating systems that perform reliably through the North Shore's coastal winters." },
  @{ name="Cloverdale"; slug="cloverdale"; neighborhoods="Cloverdale Town Centre, Clayton Heights, Fleetwood, and Rosemary Heights"; desc="Cloverdale is one of Surrey's most active HVAC markets, with a mix of heritage homes and new construction across Clayton and Fleetwood. AceComfort serves the full Cloverdale area with same-day heating and cooling service." },
  @{ name="Aldergrove"; slug="aldergrove"; neighborhoods="Aldergrove Town Centre, Glen Valley, Gloucester, and Jackman"; desc="Aldergrove homeowners and businesses trust AceComfort for reliable furnace service, heat pump installation, and air conditioning across the Fraser Valley's western edge. Fast response, local technicians." }
)

$nav = '<div class="top-bar"><div class="container"><div class="top-bar-left"><span>&#128197; 24/7 Emergency Service</span><span>&#127757; Metro Vancouver &amp; the Lower Mainland since 1995</span></div><div class="top-bar-right"><a href="../rebates.html" style="color:#4ade80;font-weight:600;">&#127383; Up to $10,000 in Rebates Available</a></div></div></div>
  <header class="site-header"><div class="container"><nav class="navbar"><a href="../index.html" class="logo"><img src="../images/Ace Comfort Logo.jpg" alt="AceComfort" class="logo-img" /></a><ul class="nav-menu" id="navMenu"><li class="nav-item"><a href="../index.html" class="nav-link">Home</a></li><li class="nav-item"><a href="../heating/index.html" class="nav-link">Heating <span class="chevron">&#9660;</span></a><div class="dropdown"><a href="../heating/furnaces.html">Furnaces</a><a href="../heating/boilers.html">Boilers</a><a href="../heating/hot-water-tanks.html">Hot Water Tanks</a><a href="../heating/tankless.html">Tankless Heaters</a><a href="../heating/combi-boiler.html">Combi Boilers</a><a href="../heating/rooftop.html">Rooftop Units</a><a href="../heating/unit-heaters.html">Unit Heaters</a></div></li><li class="nav-item"><a href="../air-conditioning/index.html" class="nav-link">Air Conditioning <span class="chevron">&#9660;</span></a><div class="dropdown"><a href="../air-conditioning/central.html">Central AC</a><a href="../air-conditioning/ductless.html">Ductless AC</a></div></li><li class="nav-item"><a href="../heat-pumps/index.html" class="nav-link">Heat Pumps <span class="chevron">&#9660;</span></a><div class="dropdown"><a href="../heat-pumps/central.html">Central Heat Pumps</a><a href="../heat-pumps/ductless.html">Ductless Heat Pumps</a><a href="../heat-pumps/water-source.html">Water Source</a></div></li><li class="nav-item"><a href="../air-duct-cleaning/index.html" class="nav-link">Air Duct Cleaning <span class="chevron">&#9660;</span></a><div class="dropdown"><a href="../air-duct-cleaning/residential.html">Residential</a><a href="../air-duct-cleaning/commercial.html">Commercial</a></div></li><li class="nav-item"><a href="../membership.html" class="nav-link">Membership</a></li><li class="nav-item"><a href="../rebates.html" class="nav-link">Rebates</a></li><li class="nav-item"><a href="../contact.html" class="nav-link">Contact Us</a></li></ul><div class="nav-cta"><a href="tel:6046363939" class="nav-phone">&#128222; (604) 636-3939</a><a href="../contact.html" class="btn btn-primary btn-sm">Book Service</a><button class="menu-toggle" id="menuToggle" aria-label="Toggle menu"><span></span><span></span><span></span></button></div></nav></div></header>'

foreach ($city in $cities) {
  $n = $city.name
  $nb = $city.neighborhoods
  $d = $city.desc
  $slug = $city.slug

  $html = @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" /><meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Heating, AC &amp; Heat Pump Service in $n BC | AceComfort</title>
  <meta name="description" content="AceComfort provides expert furnace repair, heat pump installation, AC service, boiler repair, tankless water heater service, combi boiler installation, and air duct cleaning in $n BC. Same-day service. Call (604) 636-3939." />
  <meta name="keywords" content="heat pump $n, heat pump installation $n BC, heat pump repair $n, furnace repair $n, furnace installation $n BC, air conditioning $n, AC repair $n, boiler repair $n, tankless water heater $n, combi boiler $n, air duct cleaning $n, heating $n BC, HVAC $n" />
  <link rel="canonical" href="https://www.acecomfort.ca/locations/$slug.html" />
  <link rel="preconnect" href="https://fonts.googleapis.com" /><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="../css/style.css" />
</head>
<body>
  $nav

  <section class="page-hero"><div class="container">
    <ul class="breadcrumb"><li><a href="../index.html">Home</a></li><li><a href="../locations.html">Service Areas</a></li><li>$n</li></ul>
    <h1>HVAC Service in $n, BC — Heating, Cooling &amp; Heat Pumps</h1>
    <p>$d Fully licensed, insured, and available 24/7 for emergency service. Call (604) 636-3939.</p>
  </div></section>

  <!-- Intro -->
  <section class="section"><div class="container"><div class="grid-2" style="gap:4rem;align-items:center;">
    <div>
      <div class="label">$n, BC</div>
      <h2>Your Local HVAC Specialists in $n</h2>
      <p>AceComfort has been serving $n homeowners and businesses since 1995. Our licensed Red Seal technicians cover all neighbourhoods — $nb — with fast, honest service and zero hidden fees.</p>
      <p style="margin-top:1rem;">We use <strong>Simply Prime CRM</strong>, AI-powered field service software, on every job. That means digital checklists, AI-assisted diagnostics, and a complete service report emailed to you the moment the job is done — no guesswork, no missed steps.</p>
      <div style="margin-top:2rem;display:flex;gap:1rem;flex-wrap:wrap;">
        <a href="../contact.html" class="btn btn-primary">Book Service in $n</a>
        <a href="tel:6046363939" class="btn btn-outline">&#128222; (604) 636-3939</a>
      </div>
    </div>
    <div>
      <div style="background:var(--off-white);border:1px solid var(--border);border-radius:var(--radius-lg);padding:2rem;">
        <h3 style="margin-bottom:1.25rem;">Services Available in $n</h3>
        <ul class="service-list">
          <li>Heat Pump Installation, Repair &amp; Service</li>
          <li>Furnace Installation, Repair &amp; Tune-Up</li>
          <li>Boiler Service &amp; Replacement</li>
          <li>Combi Boiler Installation &amp; Repair</li>
          <li>Tankless Water Heater Service</li>
          <li>Central &amp; Ductless Air Conditioning</li>
          <li>Air Conditioning Repair</li>
          <li>Air Duct Cleaning</li>
          <li>24/7 Emergency HVAC Service</li>
        </ul>
      </div>
    </div>
  </div></div></section>

  <!-- HEAT PUMP -->
  <section class="section" style="background:var(--off-white);" id="heat-pump">
    <div class="container">
      <div class="section-header">
        <div class="label">Heat Pumps</div>
        <h2>Heat Pump Installation, Repair &amp; Service in $n</h2>
        <p>Heat pumps are BC's fastest-growing home comfort upgrade — heating in winter, cooling in summer, and qualifying for up to $10,000 in rebates. AceComfort is a certified installer serving $n with same-day heat pump service and repair.</p>
      </div>
      <div class="grid-3">
        <div class="card" style="padding:2rem;">
          <div style="font-size:2.25rem;margin-bottom:1rem;">&#9832;</div>
          <h3>Heat Pump Installation $n</h3>
          <p>New central or ductless heat pump installed and commissioned in one day. We handle all BC Hydro, CleanBC, and Canada Greener Homes rebate applications for $n homeowners — up to $10,000+ in combined rebates.</p>
          <ul class="service-list" style="margin:1rem 0;">
            <li>Central (Ducted) Heat Pumps</li>
            <li>Ductless Mini-Split Systems</li>
            <li>Multi-Zone Installations</li>
            <li>Full Rebate Application Included</li>
          </ul>
          <a href="../contact.html" class="btn btn-primary" style="margin-top:1rem;display:inline-block;">Get a Free Quote &#8594;</a>
        </div>
        <div class="card" style="padding:2rem;">
          <div style="font-size:2.25rem;margin-bottom:1rem;">&#128295;</div>
          <h3>Heat Pump Repair $n</h3>
          <p>Not heating or cooling properly? Our technicians use Simply Prime CRM's AI-assisted diagnostics to pinpoint the true cause of failure — so you pay for the right fix, not a guess. Same-day heat pump repair available across $n.</p>
          <ul class="service-list" style="margin:1rem 0;">
            <li>All Makes &amp; Models Serviced</li>
            <li>AI-Assisted Fault Diagnosis</li>
            <li>Same-Day &amp; Emergency Response</li>
            <li>Upfront Written Pricing</li>
          </ul>
          <a href="../contact.html" class="btn btn-primary" style="margin-top:1rem;display:inline-block;">Book Repair &#8594;</a>
        </div>
        <div class="card" style="padding:2rem;">
          <div style="font-size:2.25rem;margin-bottom:1rem;">&#9881;</div>
          <h3>Heat Pump Service $n</h3>
          <p>Annual heat pump maintenance in $n keeps your system running at peak efficiency year-round. Our digital service checklist via Simply Prime CRM ensures every step is completed and documented — you receive a full service report on completion.</p>
          <ul class="service-list" style="margin:1rem 0;">
            <li>Refrigerant Level Check</li>
            <li>Coil Cleaning &amp; Filter Service</li>
            <li>Electrical &amp; Controls Inspection</li>
            <li>Digital Warranty Certificate</li>
          </ul>
          <a href="../contact.html" class="btn btn-primary" style="margin-top:1rem;display:inline-block;">Book Tune-Up &#8594;</a>
        </div>
      </div>
    </div>
  </section>

  <!-- HEATING -->
  <section class="section" id="heating">
    <div class="container">
      <div class="section-header">
        <div class="label">Heating</div>
        <h2>Furnace, Boiler, Tankless &amp; Combi Boiler Service in $n</h2>
        <p>From emergency furnace repair to new high-efficiency boiler installation, AceComfort covers all heating systems across $n. Same-day service, licensed technicians, and AI-powered diagnostics on every call.</p>
      </div>
      <div class="grid-2" style="gap:2rem;">
        <div class="card" style="padding:2rem;">
          <h3>&#128293; Furnace Repair &amp; Installation $n</h3>
          <p>No heat? We respond fast across $n. Our technicians use AI-assisted diagnostic software to find the root cause of furnace failures — not just replace parts and hope. New furnace installations completed with a full digital checklist via Simply Prime CRM.</p>
          <ul class="service-list" style="margin:1rem 0;">
            <li>Emergency Furnace Repair — 24/7</li>
            <li>New High-Efficiency Furnace Installation</li>
            <li>Annual Furnace Safety Tune-Up</li>
            <li>All Makes &amp; Models — Carrier, Lennox, Napoleon, Trane</li>
          </ul>
          <a href="../heating/furnaces.html" class="btn btn-outline" style="margin-top:1rem;display:inline-block;">Learn More &#8594;</a>
        </div>
        <div class="card" style="padding:2rem;">
          <h3>&#128167; Boiler Service &amp; Replacement $n</h3>
          <p>AceComfort services, repairs, and replaces all types of hot water boilers in $n homes and businesses. Our technicians are experienced with hydronic systems, baseboard heat, and radiant floor systems across all major boiler brands.</p>
          <ul class="service-list" style="margin:1rem 0;">
            <li>Boiler Repair &amp; Emergency Service</li>
            <li>High-Efficiency Boiler Installation</li>
            <li>Annual Boiler Maintenance Contract</li>
            <li>Hydronic System Inspection &amp; Balancing</li>
          </ul>
          <a href="../heating/boilers.html" class="btn btn-outline" style="margin-top:1rem;display:inline-block;">Learn More &#8594;</a>
        </div>
        <div class="card" style="padding:2rem;">
          <h3>&#128167; Tankless Water Heater Service $n</h3>
          <p>Tankless water heater not performing? AceComfort installs, services, and repairs Navien, Rinnai, Bosch, and all major tankless brands in $n. On-demand hot water with AI-verified service on every visit.</p>
          <ul class="service-list" style="margin:1rem 0;">
            <li>Tankless Water Heater Installation</li>
            <li>Repair &amp; Error Code Diagnostics</li>
            <li>Descaling &amp; Annual Maintenance</li>
            <li>Conversion from Tank to Tankless</li>
          </ul>
          <a href="../heating/tankless.html" class="btn btn-outline" style="margin-top:1rem;display:inline-block;">Learn More &#8594;</a>
        </div>
        <div class="card" style="padding:2rem;">
          <h3>&#9874; Combi Boiler Installation &amp; Repair $n</h3>
          <p>A combi boiler provides both home heating and domestic hot water from one compact unit — ideal for $n homes looking to save space and increase efficiency. AceComfort installs and services all combi boiler brands in $n.</p>
          <ul class="service-list" style="margin:1rem 0;">
            <li>Combi Boiler Installation</li>
            <li>Repair &amp; Diagnostics</li>
            <li>Annual Servicing &amp; Safety Check</li>
            <li>Navien, Bosch, Viessmann &amp; More</li>
          </ul>
          <a href="../heating/combi-boiler.html" class="btn btn-outline" style="margin-top:1rem;display:inline-block;">Learn More &#8594;</a>
        </div>
      </div>
    </div>
  </section>

  <!-- AIR CONDITIONING -->
  <section class="section" style="background:var(--off-white);" id="air-conditioning">
    <div class="container">
      <div class="section-header">
        <div class="label">Air Conditioning</div>
        <h2>Air Conditioning Installation &amp; Repair in $n</h2>
        <p>Stay cool through every $n summer. AceComfort installs, repairs, and services central air conditioning and ductless mini-split systems across $n — with same-day AC repair available.</p>
      </div>
      <div class="grid-3">
        <div class="card" style="padding:2rem;">
          <div style="font-size:2.25rem;margin-bottom:1rem;">&#10052;</div>
          <h3>Central AC Installation $n</h3>
          <p>Cool your entire $n home through existing ductwork. Properly sized central AC installed in one day. We perform Manual J load calculations — not guesswork — and use Simply Prime CRM's digital installation checklist on every job.</p>
          <ul class="service-list" style="margin:1rem 0;">
            <li>Carrier, Lennox, Trane &amp; More</li>
            <li>Manual J Load Calculation</li>
            <li>One-Day Installation</li>
          </ul>
          <a href="../air-conditioning/central.html" class="btn btn-primary" style="margin-top:1rem;display:inline-block;">Learn More &#8594;</a>
        </div>
        <div class="card" style="padding:2rem;">
          <div style="font-size:2.25rem;margin-bottom:1rem;">&#127744;</div>
          <h3>Ductless AC Installation $n</h3>
          <p>No ductwork in your $n home? Ductless mini-split AC is the fastest, cleanest solution. One outdoor unit, one or more indoor heads, installed in a single day. Mitsubishi, Daikin, Carrier, and LG systems available.</p>
          <ul class="service-list" style="margin:1rem 0;">
            <li>Single &amp; Multi-Zone Systems</li>
            <li>No Ductwork Required</li>
            <li>Whisper-Quiet Operation</li>
          </ul>
          <a href="../air-conditioning/ductless.html" class="btn btn-primary" style="margin-top:1rem;display:inline-block;">Learn More &#8594;</a>
        </div>
        <div class="card" style="padding:2rem;">
          <div style="font-size:2.25rem;margin-bottom:1rem;">&#128295;</div>
          <h3>Air Conditioning Repair $n</h3>
          <p>AC not cooling your $n home? We diagnose and repair all AC makes and models — central and ductless — using AI-assisted diagnostic software to identify the true root cause so the repair is right the first time. Same-day AC repair available.</p>
          <ul class="service-list" style="margin:1rem 0;">
            <li>Same-Day AC Repair Available</li>
            <li>AI-Assisted Fault Diagnosis</li>
            <li>All Brands Serviced</li>
            <li>Upfront Written Quote</li>
          </ul>
          <a href="../contact.html" class="btn btn-primary" style="margin-top:1rem;display:inline-block;">Book Repair &#8594;</a>
        </div>
      </div>
    </div>
  </section>

  <!-- AIR DUCT CLEANING -->
  <section class="section" id="air-duct-cleaning">
    <div class="container">
      <div class="grid-2" style="gap:4rem;align-items:center;">
        <div>
          <div class="label">Air Duct Cleaning</div>
          <h2>Air Duct Cleaning in $n</h2>
          <p>Dirty air ducts reduce HVAC efficiency and circulate dust, allergens, and mould spores throughout your $n home. AceComfort provides professional residential and commercial air duct cleaning across $n — using powerful extraction equipment that removes built-up debris at the source.</p>
          <p style="margin-top:1rem;">Our duct cleaning service is ideal after home renovations, when moving into a new property, or every 3–5 years as part of regular HVAC maintenance. Every job includes a before-and-after report so you can see exactly what was removed.</p>
          <ul style="list-style:none;padding:0;margin:1.5rem 0;display:flex;flex-direction:column;gap:0.75rem;">
            <li style="display:flex;gap:0.75rem;align-items:flex-start;"><span style="color:var(--orange);flex-shrink:0;">&#10003;</span><span><strong>Residential Duct Cleaning</strong> — All supply and return ducts, registers, and main trunk lines cleaned and sanitized.</span></li>
            <li style="display:flex;gap:0.75rem;align-items:flex-start;"><span style="color:var(--orange);flex-shrink:0;">&#10003;</span><span><strong>Commercial Duct Cleaning</strong> — Office buildings, strata common areas, and commercial properties.</span></li>
            <li style="display:flex;gap:0.75rem;align-items:flex-start;"><span style="color:var(--orange);flex-shrink:0;">&#10003;</span><span><strong>Dryer Vent Cleaning</strong> — Reduces fire risk and restores dryer efficiency.</span></li>
            <li style="display:flex;gap:0.75rem;align-items:flex-start;"><span style="color:var(--orange);flex-shrink:0;">&#10003;</span><span><strong>Post-Renovation Cleaning</strong> — Removes drywall dust, insulation fibres, and construction debris.</span></li>
          </ul>
          <a href="../air-duct-cleaning/index.html" class="btn btn-primary">Learn About Duct Cleaning &#8594;</a>
        </div>
        <div>
          <div style="background:var(--off-white);border:1px solid var(--border);border-radius:var(--radius-lg);padding:2rem;">
            <h3 style="margin-bottom:1rem;">Why $n Homeowners Choose AceComfort</h3>
            <ul style="list-style:none;padding:0;display:flex;flex-direction:column;gap:0.85rem;">
              <li style="display:flex;gap:0.75rem;align-items:flex-start;"><span style="color:var(--orange);font-size:1.1rem;flex-shrink:0;">&#10003;</span><span><strong>Serving $n Since 1995</strong> — 30 years of local experience in Metro Vancouver.</span></li>
              <li style="display:flex;gap:0.75rem;align-items:flex-start;"><span style="color:var(--orange);font-size:1.1rem;flex-shrink:0;">&#10003;</span><span><strong>Licensed &amp; Insured</strong> — Red Seal certified technicians on every job.</span></li>
              <li style="display:flex;gap:0.75rem;align-items:flex-start;"><span style="color:var(--orange);font-size:1.1rem;flex-shrink:0;">&#10003;</span><span><strong>Simply Prime CRM</strong> — AI-powered software ensures nothing is missed on any service call.</span></li>
              <li style="display:flex;gap:0.75rem;align-items:flex-start;"><span style="color:var(--orange);font-size:1.1rem;flex-shrink:0;">&#10003;</span><span><strong>24/7 Emergency Service</strong> — No heat or no AC? We're available around the clock.</span></li>
              <li style="display:flex;gap:0.75rem;align-items:flex-start;"><span style="color:var(--orange);font-size:1.1rem;flex-shrink:0;">&#10003;</span><span><strong>Upfront Pricing</strong> — Written quote before any work begins. No surprise invoices.</span></li>
              <li style="display:flex;gap:0.75rem;align-items:flex-start;"><span style="color:var(--orange);font-size:1.1rem;flex-shrink:0;">&#10003;</span><span><strong>Rebate Application Included</strong> — We handle all BC Hydro, CleanBC, and federal rebate paperwork.</span></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="cta-section"><div class="container">
    <h2>Book HVAC Service in $n Today</h2>
    <p>Same-day heating, cooling, and heat pump service across $n. Call now or request a free quote online.</p>
    <div style="display:flex;gap:1rem;justify-content:center;flex-wrap:wrap;">
      <a href="../contact.html" class="btn btn-secondary btn-lg">Get a Free Quote</a>
      <a href="tel:6046363939" class="btn btn-lg" style="background:#fff2;color:#fff;border:2px solid rgba(255,255,255,0.5);">&#128222; (604) 636-3939</a>
    </div>
  </div></section>

  <footer class="site-footer"><div class="container"><div class="footer-grid"><div class="footer-brand"><a href="../index.html" class="logo" style="margin-bottom:1rem;"><img src="../images/Ace Comfort Logo.jpg" alt="AceComfort" class="logo-img" /></a><p>Metro Vancouver's trusted HVAC experts since 1995.</p></div><div class="footer-col"><h4>Services</h4><ul><li><a href="../heating/index.html">Heating</a></li><li><a href="../air-conditioning/index.html">Air Conditioning</a></li><li><a href="../heat-pumps/index.html">Heat Pumps</a></li><li><a href="../air-duct-cleaning/index.html">Duct Cleaning</a></li></ul></div><div class="footer-col"><h4>Other Areas</h4><ul><li><a href="vancouver.html">Vancouver</a></li><li><a href="burnaby.html">Burnaby</a></li><li><a href="surrey.html">Surrey</a></li><li><a href="richmond.html">Richmond</a></li><li><a href="coquitlam.html">Coquitlam</a></li><li><a href="north-vancouver.html">North Vancouver</a></li></ul></div><div class="footer-col"><h4>Contact</h4><div class="footer-contact-item">&#128222; <span><a href="tel:6046363939" style="color:#fff;">(604) 636-3939</a></span></div></div></div></div><div class="footer-bottom"><div class="container"><span>&copy; 2025 AceComfort Heating &amp; Air Conditioning</span></div></div></footer>
  <div class="floating-cta"><a href="tel:6046363939" class="float-btn emergency">&#128222; <span class="label">Emergency: (604) 636-3939</span></a><a href="../contact.html" class="float-btn">&#128197; <span class="label">Book Service</span></a></div>
  <script src="../js/main.js"></script>
</body></html>
"@

  $outPath = "C:\Users\ryans\acecomfort-website\locations\$slug.html"
  [System.IO.File]::WriteAllText($outPath, $html, [System.Text.Encoding]::UTF8)
  Write-Host "Created: $outPath"
}

Write-Host "Done - all city pages generated."
