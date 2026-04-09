# ============================================================
# AceComfort — Generate City+Service pages (266 pages total)
# ============================================================

$basePath = "C:\Users\ryans\acecomfort-website\locations"

# ---- CITIES ------------------------------------------------
$cities = @(
  @{ name="West Vancouver";  slug="west-vancouver";  nb="Ambleside, Dundarave, Horseshoe Bay, Caulfeild, and the British Properties" },
  @{ name="Vancouver";       slug="vancouver";       nb="East Van, Kitsilano, Point Grey, West End, Mount Pleasant, Dunbar, and Oakridge" },
  @{ name="Burnaby";         slug="burnaby";         nb="Metrotown, Brentwood, Lougheed, South Burnaby, and North Burnaby" },
  @{ name="Surrey";          slug="surrey";          nb="Guildford, Newton, Fleetwood, Whalley, South Surrey, and Cloverdale" },
  @{ name="Richmond";        slug="richmond";        nb="Steveston, Brighouse, Broadmoor, Hamilton, and the City Centre" },
  @{ name="Coquitlam";       slug="coquitlam";       nb="Maillardville, Burke Mountain, Westwood Plateau, New Horizons, and Austin Heights" },
  @{ name="North Vancouver"; slug="north-vancouver"; nb="Lower Lonsdale, Lynn Valley, Deep Cove, Edgemont, and Capilano" },
  @{ name="Port Coquitlam";  slug="port-coquitlam";  nb="Citadel, Mary Hill, Oxford Heights, Lincoln Park, and Downtown Port Coquitlam" },
  @{ name="Port Moody";      slug="port-moody";      nb="Inlet Centre, Heritage Mountain, Moody Centre, Glenayre, and College Park" },
  @{ name="New Westminster"; slug="new-westminster"; nb="Sapperton, Queens Park, Queensborough, Uptown, and Downtown" },
  @{ name="Ladner";          slug="ladner";          nb="Ladner Village, Boundary Bay, Tilbury, and South Delta" },
  @{ name="Tsawwassen";      slug="tsawwassen";      nb="Tsawwassen Springs, Beach Grove, English Bluff, and Boundary Bay" },
  @{ name="Horseshoe Bay";   slug="horseshoe-bay";   nb="Horseshoe Bay Village, Gleneagles, and Eagle Harbour" },
  @{ name="Cloverdale";      slug="cloverdale";      nb="Cloverdale Town Centre, Clayton Heights, Fleetwood, and Rosemary Heights" },
  @{ name="Aldergrove";      slug="aldergrove";      nb="Aldergrove Town Centre, Glen Valley, Gloucester, and Jackman" },
  @{ name="Langley";         slug="langley";         nb="Langley City, Willowbrook, Walnut Grove, Murrayville, and Fort Langley" },
  @{ name="Maple Ridge";     slug="maple-ridge";     nb="Downtown Maple Ridge, Albion, Silver Valley, and Cottonwood" },
  @{ name="White Rock";      slug="white-rock";      nb="White Rock Beach, Semiahmoo, Ocean Park, and South Surrey" },
  @{ name="Abbotsford";      slug="abbotsford";      nb="Downtown Abbotsford, Clearbrook, Abbotsford East, Auguston, and Matsqui" }
)

# ---- SERVICES ----------------------------------------------
$services = @(
  @{
    name    = "Heat Pump Installation"
    slug    = "heat-pump-installation"
    photo   = "heat pump installation.jpg"
    label   = "Heat Pumps"
    section = "heat-pumps"
    intro   = "AceComfort installs central ducted and ductless mini-split heat pumps in CITY homes in as little as one day. Every installation includes a Manual J heat load calculation, rebate application to BC Hydro and CleanBC, and a full commissioning report via Simply Prime CRM."
    inc1    = "Central Ducted Heat Pumps"; inc2 = "Ductless Mini-Split Systems"; inc3 = "Multi-Zone Installations"
    inc4    = "Manual J Heat Load Calculation"; inc5 = "BC Hydro &amp; CleanBC Rebate Application"; inc6 = "One-Day Installation Available"
    note    = "CITY homeowners replacing electric baseboard heat may qualify for up to $20,000 in stacked rebates from BC Hydro and CleanBC. AceComfort is a certified HPCN contractor and handles all paperwork."
  },
  @{
    name    = "Heat Pump Repair"
    slug    = "heat-pump-repair"
    photo   = "heat pump repair.jpg"
    label   = "Heat Pumps"
    section = "heat-pumps"
    intro   = "Heat pump not heating or cooling properly? AceComfort technicians use Simply Prime CRM AI-assisted diagnostics to pinpoint the exact cause of failure before touching your system. Same-day heat pump repair is available across CITY."
    inc1    = "All Makes and Models Serviced"; inc2 = "AI-Assisted Fault Diagnosis"; inc3 = "Same-Day and Emergency Response"
    inc4    = "Refrigerant Leak Detection and Repair"; inc5 = "Control Board and Electrical Diagnosis"; inc6 = "Upfront Written Pricing Before Work Begins"
    note    = "Common heat pump faults we repair in CITY: not heating at low temperatures, refrigerant leaks, error codes, compressor issues, reversing valve failure, and frozen coils. We carry parts for Mitsubishi, Daikin, Carrier, LG, and all major brands."
  },
  @{
    name    = "Heat Pump Service"
    slug    = "heat-pump-service"
    photo   = "heat pump service.jpg"
    label   = "Heat Pumps"
    section = "heat-pumps"
    intro   = "Annual heat pump maintenance keeps your CITY system running at peak efficiency, extends equipment life, and protects your warranty. AceComfort completes a comprehensive digital service checklist via Simply Prime CRM on every maintenance visit."
    inc1    = "Coil Cleaning and Inspection"; inc2 = "Refrigerant Level Check"; inc3 = "Filter Service and Replacement"
    inc4    = "Electrical and Controls Inspection"; inc5 = "Outdoor Unit Cleaning"; inc6 = "Digital Service Report Emailed Same Day"
    note    = "AceComfort membership plans include annual heat pump service for CITY homeowners at a reduced rate, with priority scheduling and discounts on repairs. Ask about our maintenance membership when you book."
  },
  @{
    name    = "Furnace Repair"
    slug    = "furnace-repair"
    photo   = "furnace repair.jpg"
    label   = "Heating"
    section = "heating"
    intro   = "No heat in your CITY home? AceComfort responds fast. Our technicians use Simply Prime CRM AI-assisted diagnostics to find the true root cause of furnace failures so you pay for the right fix the first time. 24/7 emergency furnace repair available."
    inc1    = "24/7 Emergency Response"; inc2 = "AI-Assisted Fault Diagnosis"; inc3 = "All Makes and Models Serviced"
    inc4    = "Gas Valve, Ignitor, and Heat Exchanger Repair"; inc5 = "Blower Motor and Control Board Diagnosis"; inc6 = "Upfront Pricing Before Any Work Begins"
    note    = "We service all furnace brands in CITY including Carrier, Lennox, Napoleon, Trane, Goodman, and York. If your furnace is beyond economical repair, we provide a same-day replacement quote with financing available."
  },
  @{
    name    = "Furnace Installation"
    slug    = "furnace-installation"
    photo   = "furnace installtion.jpg"
    label   = "Heating"
    section = "heating"
    intro   = "Replacing your CITY home's furnace is a major investment. AceComfort sizes every new furnace installation using a Manual J load calculation so you get the right capacity for your home, not just what fits in the space. High-efficiency models installed in one day."
    inc1    = "Manual J Load Calculation Included"; inc2 = "High-Efficiency Models (96% AFUE+)"; inc3 = "Same-Day Removal of Old Furnace"
    inc4    = "Carrier, Lennox, Napoleon, and Trane Available"; inc5 = "Permit and Inspection Coordination"; inc6 = "10-Year Parts and Labor Warranty Options"
    note    = "A properly sized, high-efficiency furnace in CITY can reduce your heating costs by 20 to 30 percent compared to an aging mid-efficiency unit. AceComfort provides a full written quote before any work begins."
  },
  @{
    name    = "Boiler Repair"
    slug    = "boiler-repair"
    photo   = "boiler repair.jpg"
    label   = "Heating"
    section = "heating"
    intro   = "Boiler not heating? Leaking? Strange noises? AceComfort technicians are experienced with all types of hydronic heating systems in CITY homes, from older cast-iron boilers to modern condensing units. Same-day and emergency boiler repair available."
    inc1    = "24/7 Emergency Boiler Repair"; inc2 = "Hydronic and Radiant Floor Systems"; inc3 = "All Makes and Models"
    inc4    = "Pressure Relief Valve and Expansion Tank Service"; inc5 = "Circulator Pump Repair and Replacement"; inc6 = "Heat Exchanger Inspection and Cleaning"
    note    = "We repair Navien, Bosch, Viessmann, Weil-McLain, Burnham, and all major boiler brands throughout CITY. Our technicians carry common parts on every van to complete most repairs in a single visit."
  },
  @{
    name    = "Boiler Installation"
    slug    = "boiler-installation"
    photo   = "boiler installation.jpeg"
    label   = "Heating"
    section = "heating"
    intro   = "Installing a new high-efficiency boiler in your CITY home reduces energy bills, improves comfort, and can last 20 to 25 years with proper maintenance. AceComfort designs and installs complete hydronic heating systems for new homes and retrofits."
    inc1    = "High-Efficiency Condensing Boilers"; inc2 = "Hydronic System Design and Balancing"; inc3 = "Radiant Floor Heating Integration"
    inc4    = "Navien, Bosch, and Viessmann Available"; inc5 = "Permit and Gas Line Coordination"; inc6 = "Full Commissioning and Pressure Test"
    note    = "Replacing an older boiler in CITY with a modern condensing unit (95%+ efficiency) can cut heating costs significantly. AceComfort provides a full system assessment and written quote before installation begins."
  },
  @{
    name    = "Combi Boiler"
    slug    = "combi-boiler"
    photo   = "combi boiler installation.jpg"
    label   = "Heating"
    section = "heating"
    intro   = "A combi boiler provides both home heating and on-demand domestic hot water from one compact unit, eliminating the need for a separate hot water tank. Ideal for CITY homes looking to save space and improve efficiency. AceComfort installs and services all combi boiler brands."
    inc1    = "Space-Saving Single-Unit Design"; inc2 = "On-Demand Hot Water with No Storage Tank"; inc3 = "High-Efficiency Models (90%+ AFUE)"
    inc4    = "Navien, Bosch, and Viessmann Systems"; inc5 = "Full Hydronic Integration"; inc6 = "Annual Service and Maintenance Plans"
    note    = "Combi boilers are a popular choice in CITY for homes with limited mechanical room space. AceComfort assesses your home's heating and hot water demands to confirm a combi boiler is the right fit before recommending one."
  },
  @{
    name    = "Tankless Water Heater"
    slug    = "tankless-water-heater"
    photo   = "tankless water heater installation.jpg"
    label   = "Heating"
    section = "heating"
    intro   = "Tankless water heaters deliver hot water on demand with no storage tank, no standby heat loss, and a lifespan nearly twice that of conventional tanks. AceComfort installs, repairs, and services Navien, Rinnai, Bosch, and all major brands throughout CITY."
    inc1    = "Navien, Rinnai, and Bosch Systems"; inc2 = "Natural Gas and Propane Models"; inc3 = "Conversion from Tank to Tankless"
    inc4    = "Error Code Diagnostics and Repair"; inc5 = "Annual Descaling and Maintenance"; inc6 = "Same-Day Installation Available"
    note    = "Tankless water heaters in CITY homes typically pay for themselves in energy savings within 5 to 8 years. AceComfort sizes the unit correctly for your household's demand and handles the gas and venting connections."
  },
  @{
    name    = "Central AC Installation"
    slug    = "central-ac-installation"
    photo   = "ac central installation.webp"
    label   = "Air Conditioning"
    section = "air-conditioning"
    intro   = "Central air conditioning cools your entire CITY home through existing ductwork, providing consistent, quiet comfort on the hottest days. AceComfort performs a Manual J load calculation on every installation to ensure the system is correctly sized."
    inc1    = "Manual J Load Calculation Included"; inc2 = "Carrier, Lennox, and Trane Systems"; inc3 = "One-Day Installation Available"
    inc4    = "Existing Ductwork Inspection and Testing"; inc5 = "Permit and Inspection Coordination"; inc6 = "Full Commissioning via Simply Prime CRM"
    note    = "An oversized or undersized AC system in CITY will short-cycle, wear out faster, and fail to dehumidify properly. AceComfort calculates the correct capacity for your home and guarantees the installation is done right."
  },
  @{
    name    = "Ductless AC Installation"
    slug    = "ductless-ac-installation"
    photo   = "ductless air conditioning installation.webp"
    label   = "Air Conditioning"
    section = "air-conditioning"
    intro   = "Ductless mini-split air conditioning is the fastest and cleanest solution for CITY homes without existing ductwork, or for targeted cooling in specific rooms. Mitsubishi, Daikin, Carrier, and LG systems installed in one day."
    inc1    = "Single-Zone and Multi-Zone Systems"; inc2 = "No Ductwork Required"; inc3 = "Mitsubishi, Daikin, Carrier, and LG"
    inc4    = "Whisper-Quiet Indoor Units"; inc5 = "Energy-Efficient Inverter Technology"; inc6 = "Installed in One Day"
    note    = "Ductless mini-splits in CITY provide both cooling in summer and heating in winter, making them a year-round comfort solution. Many models qualify for BC Hydro and CleanBC heat pump rebates. AceComfort handles the rebate application."
  },
  @{
    name    = "Air Conditioning Repair"
    slug    = "air-conditioning-repair"
    photo   = "ductless air conditioning repair.jpg"
    label   = "Air Conditioning"
    section = "air-conditioning"
    intro   = "AC not cooling? AceComfort diagnoses and repairs all air conditioning makes and models in CITY using Simply Prime CRM AI-assisted diagnostic software. Same-day AC repair is available so you are not left without cooling in the heat."
    inc1    = "Same-Day Repair Available"; inc2 = "AI-Assisted Fault Diagnosis"; inc3 = "All Makes and Models Serviced"
    inc4    = "Refrigerant Leak Detection and Recharge"; inc5 = "Capacitor, Contactor, and Fan Motor Repair"; inc6 = "Upfront Written Quote Before Any Work"
    note    = "Common AC problems we fix in CITY: not cooling, refrigerant leaks, frozen coils, tripped breakers, compressor faults, and failed capacitors. We stock common parts on every van for same-visit repairs."
  },
  @{
    name    = "AC Service"
    slug    = "ac-service"
    photo   = "central ac service.webp"
    label   = "Air Conditioning"
    section = "air-conditioning"
    intro   = "Annual AC maintenance before the summer season keeps your CITY system running efficiently, extends equipment life, and prevents mid-summer breakdowns. AceComfort completes a comprehensive digital service checklist via Simply Prime CRM on every tune-up."
    inc1    = "Coil Cleaning and Inspection"; inc2 = "Refrigerant Level Check"; inc3 = "Filter Replacement"
    inc4    = "Electrical Connections and Controls Check"; inc5 = "Condensate Drain Cleaning"; inc6 = "Digital Service Report Emailed Same Day"
    note    = "Book your CITY AC tune-up in spring before demand peaks. AceComfort membership plan members receive priority scheduling and a discounted annual maintenance rate. Ask about our maintenance membership when you book."
  },
  @{
    name    = "Air Duct Cleaning"
    slug    = "air-duct-cleaning"
    photo   = "Dryer Vent Cleaning Repair.jpg"
    label   = "Duct Cleaning"
    section = "duct-cleaning"
    intro   = "Dirty air ducts reduce HVAC efficiency and circulate dust, allergens, and mould spores through your CITY home. AceComfort provides professional residential and commercial air duct cleaning with high-power extraction equipment and complete before-and-after documentation."
    inc1    = "All Supply and Return Ducts Cleaned"; inc2 = "Trunk Lines and Plenum Cleaning"; inc3 = "Register and Grille Removal and Cleaning"
    inc4    = "Dryer Vent Cleaning Available"; inc5 = "Post-Renovation Duct Cleaning"; inc6 = "Before-and-After Photo Documentation"
    note    = "Air duct cleaning in CITY is recommended every 3 to 5 years, or after any renovation work, when moving into a new home, or if household members have respiratory sensitivities. AceComfort uses truck-mounted or high-power portable extraction equipment."
  }
)

# ---- PAGE TEMPLATE -----------------------------------------
function Get-ServicePage($city, $svc) {
  $n    = $city.name
  $slug = $city.slug
  $nb   = $city.nb
  $sn   = $svc.name
  $ss   = $svc.slug
  $sec  = $svc.section

  $intro = $svc.intro.Replace("CITY", $n)
  $note  = $svc.note.Replace("CITY", $n)

  $otherServices = $services | Where-Object { $_.slug -ne $ss } | Select-Object -First 5

  $otherLinks = ""
  foreach ($o in $otherServices) {
    $otherLinks += "          <li><a href=`"$slug-$($o.slug).html`" style=`"color:var(--navy);font-size:0.9rem;`">$n $($o.name)</a></li>`n"
  }

  return @"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" /><meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>$n $sn | AceComfort HVAC</title>
  <meta name="description" content="Professional $sn in $n, BC. AceComfort provides same-day service across $nb. Licensed, insured, and available 24/7. Call (604) 636-3939." />
  <meta name="keywords" content="$sn $n, $n $sn, HVAC $n, $sn $n BC, AceComfort $n" />
  <link rel="canonical" href="https://www.acecomfort.ca/locations/$slug-$ss.html" />
  <link rel="preconnect" href="https://fonts.googleapis.com" /><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="../css/style.css" />
</head>
<body>
  <div class="top-bar"><div class="container"><div class="top-bar-left"><span>24/7 Emergency Service</span><span>Metro Vancouver since 1995</span></div><div class="top-bar-right"><a href="../rebates.html" style="color:#4ade80;font-weight:600;">Up to $20,000 in Heat Pump Rebates Available</a></div></div></div>
  <header class="site-header"><div class="container"><nav class="navbar">
    <a href="../index.html" class="logo"><img src="../images/Ace Comfort Logo.jpg" alt="AceComfort" class="logo-img" /></a>
    <ul class="nav-menu" id="navMenu">
      <li class="nav-item"><a href="../index.html" class="nav-link">Home</a></li>
      <li class="nav-item"><a href="../heating/index.html" class="nav-link">Heating <span class="chevron">&#9660;</span></a><div class="dropdown"><a href="../heating/furnaces.html">Furnaces</a><a href="../heating/boilers.html">Boilers</a><a href="../heating/hot-water-tanks.html">Hot Water Tanks</a><a href="../heating/tankless.html">Tankless Heaters</a><a href="../heating/combi-boiler.html">Combi Boilers</a></div></li>
      <li class="nav-item"><a href="../air-conditioning/index.html" class="nav-link">Air Conditioning <span class="chevron">&#9660;</span></a><div class="dropdown"><a href="../air-conditioning/central.html">Central AC</a><a href="../air-conditioning/ductless.html">Ductless AC</a></div></li>
      <li class="nav-item"><a href="../heat-pumps/index.html" class="nav-link">Heat Pumps <span class="chevron">&#9660;</span></a><div class="dropdown"><a href="../heat-pumps/central.html">Central Heat Pumps</a><a href="../heat-pumps/ductless.html">Ductless Heat Pumps</a><a href="../heat-pumps/water-source.html">Water Source</a></div></li>
      <li class="nav-item"><a href="../air-duct-cleaning/index.html" class="nav-link">Air Duct Cleaning <span class="chevron">&#9660;</span></a><div class="dropdown"><a href="../air-duct-cleaning/residential.html">Residential</a><a href="../air-duct-cleaning/commercial.html">Commercial</a></div></li>
      <li class="nav-item"><a href="../membership.html" class="nav-link">Membership</a></li>
      <li class="nav-item"><a href="../rebates.html" class="nav-link">Rebates</a></li>
      <li class="nav-item"><a href="../contact.html" class="nav-link">Contact Us</a></li>
    </ul>
    <div class="nav-cta"><a href="tel:6046363939" class="nav-phone">(604) 636-3939</a><a href="../contact.html" class="btn btn-primary btn-sm">Book Service</a><button class="menu-toggle" id="menuToggle" aria-label="Toggle menu"><span></span><span></span><span></span></button></div>
  </nav></div></header>

  <section class="page-hero"><div class="container">
    <ul class="breadcrumb"><li><a href="../index.html">Home</a></li><li><a href="../locations.html">Service Areas</a></li><li><a href="$slug.html">$n</a></li><li>$sn</li></ul>
    <h1>$sn in $n, BC</h1>
    <p>$intro</p>
  </div></section>

  <section class="section"><div class="container">
    <div class="grid-2" style="gap:4rem;align-items:start;">
      <div>
        <div class="label">$($svc.label)</div>
        <h2>$n $sn &mdash; What Is Included</h2>
        <p style="margin-bottom:1.5rem;">Every $sn call in $n is completed by a licensed Red Seal technician using <strong>Simply Prime CRM</strong> &mdash; AI-powered field service software that runs a digital checklist on every job and delivers a complete service report to you the moment the work is done.</p>
        <ul class="service-list">
          <li>$($svc.inc1)</li>
          <li>$($svc.inc2)</li>
          <li>$($svc.inc3)</li>
          <li>$($svc.inc4)</li>
          <li>$($svc.inc5)</li>
          <li>$($svc.inc6)</li>
        </ul>
        <div style="background:rgba(39,174,96,0.07);border-left:4px solid var(--green);border-radius:0 var(--radius) var(--radius) 0;padding:1.25rem 1.5rem;margin-top:2rem;">
          <p style="font-size:0.9rem;color:var(--dark-gray);margin:0;">$note</p>
        </div>
        <div style="margin-top:2rem;display:flex;gap:1rem;flex-wrap:wrap;">
          <a href="../contact.html" class="btn btn-primary">Book $sn in $n</a>
          <a href="tel:6046363939" class="btn btn-outline">(604) 636-3939</a>
        </div>
      </div>
      <div>
        <div style="border-radius:var(--radius-lg);overflow:hidden;margin-bottom:1.5rem;">
          <img src="../images/$($svc.photo)" alt="$sn in $n BC" style="width:100%;height:300px;object-fit:cover;display:block;" loading="lazy" />
        </div>
        <div style="background:var(--navy);border-radius:var(--radius-lg);padding:2rem;color:var(--white);margin-bottom:1.5rem;">
          <h3 style="color:var(--white);margin-bottom:1rem;">Why $n Chooses AceComfort</h3>
          <ul style="list-style:none;padding:0;display:flex;flex-direction:column;gap:0.85rem;">
            <li style="display:flex;gap:0.75rem;align-items:flex-start;"><span style="color:var(--orange);flex-shrink:0;font-weight:700;">&#10003;</span><span style="color:rgba(255,255,255,0.9);">Serving $nb since 1995</span></li>
            <li style="display:flex;gap:0.75rem;align-items:flex-start;"><span style="color:var(--orange);flex-shrink:0;font-weight:700;">&#10003;</span><span style="color:rgba(255,255,255,0.9);">Licensed Red Seal technicians on every job</span></li>
            <li style="display:flex;gap:0.75rem;align-items:flex-start;"><span style="color:var(--orange);flex-shrink:0;font-weight:700;">&#10003;</span><span style="color:rgba(255,255,255,0.9);">Simply Prime CRM &mdash; AI-powered service software</span></li>
            <li style="display:flex;gap:0.75rem;align-items:flex-start;"><span style="color:var(--orange);flex-shrink:0;font-weight:700;">&#10003;</span><span style="color:rgba(255,255,255,0.9);">24/7 emergency response &mdash; we answer every call</span></li>
            <li style="display:flex;gap:0.75rem;align-items:flex-start;"><span style="color:var(--orange);flex-shrink:0;font-weight:700;">&#10003;</span><span style="color:rgba(255,255,255,0.9);">Upfront written pricing before any work begins</span></li>
          </ul>
        </div>
        <div style="background:var(--off-white);border-radius:var(--radius-lg);padding:1.5rem;">
          <h4 style="margin-bottom:1rem;font-size:1rem;">More Services in $n</h4>
          <ul style="list-style:none;padding:0;display:flex;flex-direction:column;gap:0.5rem;">
$otherLinks          </ul>
          <a href="$slug.html" style="display:inline-block;margin-top:1rem;font-size:0.85rem;color:var(--navy);font-weight:600;">View all $n services &rarr;</a>
        </div>
      </div>
    </div>
  </div></section>

  <section class="cta-section"><div class="container">
    <h2>Book $sn in $n Today</h2>
    <p>Same-day service available. Call now or request a free quote online.</p>
    <div style="display:flex;gap:1rem;justify-content:center;flex-wrap:wrap;">
      <a href="../contact.html" class="btn btn-secondary btn-lg">Get a Free Quote</a>
      <a href="tel:6046363939" class="btn btn-lg" style="background:#fff2;color:#fff;border:2px solid rgba(255,255,255,0.5);">(604) 636-3939</a>
    </div>
  </div></section>

  <footer class="site-footer"><div class="container"><div class="footer-grid">
    <div class="footer-brand"><a href="../index.html" class="logo" style="margin-bottom:1rem;"><img src="../images/Ace Comfort Logo.jpg" alt="AceComfort" class="logo-img" /></a><p>Metro Vancouver's trusted HVAC experts since 1995.</p></div>
    <div class="footer-col"><h4>Services</h4><ul><li><a href="../heating/index.html">Heating</a></li><li><a href="../air-conditioning/index.html">Air Conditioning</a></li><li><a href="../heat-pumps/index.html">Heat Pumps</a></li><li><a href="../air-duct-cleaning/index.html">Duct Cleaning</a></li></ul></div>
    <div class="footer-col"><h4>$n Services</h4><ul><li><a href="$slug-heat-pump-installation.html">Heat Pump Installation</a></li><li><a href="$slug-furnace-repair.html">Furnace Repair</a></li><li><a href="$slug-air-conditioning-repair.html">AC Repair</a></li><li><a href="$slug.html">All $n Services</a></li></ul></div>
    <div class="footer-col"><h4>Contact</h4><div class="footer-contact-item"><span><a href="tel:6046363939" style="color:#fff;">(604) 636-3939</a></span></div><div class="footer-contact-item"><span><a href="mailto:info@acecomfort.ca" style="color:rgba(255,255,255,0.65);">info@acecomfort.ca</a></span></div></div>
  </div></div><div class="footer-bottom"><div class="container"><span>&copy; 2025 AceComfort Heating &amp; Air Conditioning</span></div></div></footer>

  <div class="floating-cta"><a href="tel:6046363939" class="float-btn emergency"><span class="label">Emergency: (604) 636-3939</span></a><a href="../contact.html" class="float-btn"><span class="label">Book Service</span></a></div>
  <script src="../js/main.js"></script>
</body>
</html>
"@
}

# ---- GENERATE ALL PAGES ------------------------------------
$count = 0
foreach ($city in $cities) {
  foreach ($svc in $services) {
    $html     = Get-ServicePage $city $svc
    $outPath  = "$basePath\$($city.slug)-$($svc.slug).html"
    [System.IO.File]::WriteAllText($outPath, $html, [System.Text.Encoding]::UTF8)
    $count++
  }
}

Write-Host "Done. Generated $count pages."
