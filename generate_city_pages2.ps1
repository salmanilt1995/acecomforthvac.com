$template = [System.IO.File]::ReadAllText("C:\Users\ryans\acecomfort-website\locations\west-vancouver.html", [System.Text.Encoding]::UTF8)

$cities = @(
  @{
    name = "Port Coquitlam"; slug = "port-coquitlam"; short = "PoCo"
    neighborhoods = "Citadel, Mary Hill, Oxford Heights, Lincoln Park, and Downtown Port Coquitlam"
    desc = "Port Coquitlam is one of the fastest-growing communities in the Tri-Cities. Whether you are in a newer subdivision or an older established home, AceComfort provides fast, reliable HVAC service across all of PoCo. Licensed, insured, and available 24/7. Call (604) 636-3939."
  },
  @{
    name = "Port Moody"; slug = "port-moody"; short = "Port Moody"
    neighborhoods = "Inlet Centre, Heritage Mountain, Moody Centre, Glenayre, and College Park"
    desc = "Port Moody's mix of waterfront condos, hillside homes, and new developments requires versatile HVAC expertise. AceComfort technicians serve all Port Moody neighbourhoods with same-day availability and AI-powered service software. Licensed, insured, and available 24/7. Call (604) 636-3939."
  },
  @{
    name = "New Westminster"; slug = "new-westminster"; short = "New West"
    neighborhoods = "Sapperton, Queens Park, Queensborough, Uptown, Downtown, and Connaught Heights"
    desc = "New Westminster's historic homes and newer high-rises have very different heating and cooling needs. AceComfort has served the Royal City since 1995, handling everything from heritage home boiler replacements to ductless mini-split installs in modern condos. Call (604) 636-3939."
  },
  @{
    name = "Ladner"; slug = "ladner"; short = "Ladner"
    neighborhoods = "Ladner Village, Boundary Bay, Tilbury, and South Delta"
    desc = "Ladner's quiet residential streets and waterfront properties deserve reliable HVAC service. AceComfort provides full heating, cooling, and heat pump services throughout Ladner and South Delta. Licensed, insured, and available 24/7. Call (604) 636-3939."
  },
  @{
    name = "Tsawwassen"; slug = "tsawwassen"; short = "Tsawwassen"
    neighborhoods = "Tsawwassen Springs, Beach Grove, English Bluff, and Boundary Bay"
    desc = "Tsawwassen homeowners trust AceComfort for heat pump installations, furnace replacements, and air conditioning service. We serve all Tsawwassen neighbourhoods with fast response and expert technicians. Licensed, insured, and available 24/7. Call (604) 636-3939."
  },
  @{
    name = "Horseshoe Bay"; slug = "horseshoe-bay"; short = "Horseshoe Bay"
    neighborhoods = "Horseshoe Bay Village, Gleneagles, and Eagle Harbour"
    desc = "Horseshoe Bay and Gleneagles homes face unique marine climate demands. AceComfort installs cold-climate heat pumps and high-efficiency heating systems that perform reliably through the North Shore's coastal winters. Licensed, insured, and available 24/7. Call (604) 636-3939."
  },
  @{
    name = "Cloverdale"; slug = "cloverdale"; short = "Cloverdale"
    neighborhoods = "Cloverdale Town Centre, Clayton Heights, Fleetwood, and Rosemary Heights"
    desc = "Cloverdale is one of Surrey's most active HVAC markets, with a mix of heritage homes and new construction across Clayton and Fleetwood. AceComfort serves the full Cloverdale area with same-day heating and cooling service. Call (604) 636-3939."
  },
  @{
    name = "Aldergrove"; slug = "aldergrove"; short = "Aldergrove"
    neighborhoods = "Aldergrove Town Centre, Glen Valley, Gloucester, and Jackman"
    desc = "Aldergrove homeowners and businesses trust AceComfort for reliable furnace service, heat pump installation, and air conditioning across the Fraser Valley's western edge. Fast response, local technicians. Licensed, insured, and available 24/7. Call (604) 636-3939."
  },
  @{
    name = "Langley"; slug = "langley"; short = "Langley"
    neighborhoods = "Langley City, Willowbrook, Walnut Grove, Murrayville, Brookswood, and Fort Langley"
    desc = "Langley's mix of established family homes and new Willowbrook-area subdivisions keeps AceComfort busy year-round. From furnace replacements in Fort Langley heritage homes to ductless heat pump installations in new Walnut Grove builds, we cover all of Langley with same-day service. Licensed, insured, and available 24/7. Call (604) 636-3939."
  },
  @{
    name = "Maple Ridge"; slug = "maple-ridge"; short = "Maple Ridge"
    neighborhoods = "Downtown Maple Ridge, Albion, Silver Valley, Cottonwood, and Thornhill"
    desc = "Maple Ridge homeowners trust AceComfort for heat pump installations, furnace repair, and air conditioning service across all neighbourhoods. Fast response from local technicians using AI-powered service software. Licensed, insured, and available 24/7. Call (604) 636-3939."
  },
  @{
    name = "White Rock"; slug = "white-rock"; short = "White Rock"
    neighborhoods = "White Rock Beach, Semiahmoo, Ocean Park, and South Surrey"
    desc = "White Rock's seaside climate and mix of older character homes and new South Surrey builds demand versatile HVAC expertise. AceComfort provides heat pump installation, furnace repair, and air conditioning service throughout White Rock and South Surrey. Licensed, insured, and available 24/7. Call (604) 636-3939."
  },
  @{
    name = "Abbotsford"; slug = "abbotsford"; short = "Abbotsford"
    neighborhoods = "Downtown Abbotsford, Clearbrook, Abbotsford East, Auguston, and Matsqui"
    desc = "Abbotsford's Fraser Valley climate means cold winters and hot summers. AceComfort installs and services heat pumps, furnaces, air conditioning, and boilers across all Abbotsford neighbourhoods with fast, reliable service. Licensed, insured, and available 24/7. Call (604) 636-3939."
  }
)

foreach ($city in $cities) {
    $n    = $city.name
    $slug = $city.slug
    $nb   = $city.neighborhoods
    $desc = $city.desc

    $html = $template
    # Replace West Vancouver with city name
    $html = $html.Replace("West Vancouver, BC", "$n, BC")
    $html = $html.Replace("West Vancouver", $n)
    $html = $html.Replace("west-vancouver", $slug)
    # Replace neighborhoods
    $html = $html.Replace("Ambleside, Dundarave, Horseshoe Bay, Caulfeild, and the British Properties", $nb)
    # Replace intro paragraph (the page-hero <p>)
    $html = $html.Replace("West Vancouver's luxury homes and hillside properties demand HVAC specialists with real experience. AceComfort has served the North Shore since 1995, from high-efficiency heat pump upgrades in the British Properties to emergency furnace repairs in Ambleside and Dundarave. Licensed, insured, and available 24/7. Call (604) 636-3939.", $desc)
    # Replace the intro body text
    $html = $html.Replace("AceComfort technicians serve all West Vancouver neighbourhoods including Ambleside, Dundarave, Horseshoe Bay, Caulfeild, and the British Properties. Our Red Seal certified technicians bring 30 years of local expertise to every call.", "AceComfort technicians serve all $n neighbourhoods including $nb. Our Red Seal certified technicians bring 30 years of local expertise to every call.")
    # Title & meta
    $html = $html.Replace("Heating, AC &amp; Heat Pump Service West Vancouver BC | AceComfort", "Heating, AC &amp; Heat Pump Service $n BC | AceComfort")
    $html = $html.Replace("heat pump West Vancouver, heat pump installation West Vancouver BC, heat pump repair West Vancouver, furnace repair West Vancouver, air conditioning West Vancouver, AC repair West Vancouver, boiler repair West Vancouver, tankless water heater West Vancouver, combi boiler West Vancouver, air duct cleaning West Vancouver, heating West Vancouver BC, HVAC West Vancouver", "heat pump $n, heat pump installation $n BC, heat pump repair $n, furnace repair $n, air conditioning $n, AC repair $n, boiler repair $n, tankless water heater $n, combi boiler $n, air duct cleaning $n, heating $n BC, HVAC $n")
    $html = $html.Replace("https://www.acecomfort.ca/locations/west-vancouver.html", "https://www.acecomfort.ca/locations/$slug.html")
    $html = $html.Replace("Expert heat pump installation, heat pump repair, furnace repair, AC service, boiler repair, tankless water heater, combi boiler, and air duct cleaning in West Vancouver BC", "Expert heat pump installation, heat pump repair, furnace repair, AC service, boiler repair, tankless water heater, combi boiler, and air duct cleaning in $n BC")
    # Replace the "Why West Vancouver homeowners" heading
    $html = $html.Replace("Why West Vancouver Homeowners Choose AceComfort", "Why $n Homeowners Choose AceComfort")
    # Replace breadcrumb
    $html = $html.Replace("<li>West Vancouver</li>", "<li>$n</li>")

    $outPath = "C:\Users\ryans\acecomfort-website\locations\$slug.html"
    [System.IO.File]::WriteAllText($outPath, $html, [System.Text.Encoding]::UTF8)
    Write-Host "Created: $outPath"
}

Write-Host "Done."
