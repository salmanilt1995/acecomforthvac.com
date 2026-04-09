from pathlib import Path

replacements = [
    ('&#127757; Metro Vancouver &amp; the Lower Mainland since 1995', '&#127757; 101-3993 Henning Drive Burnaby BC V5C 6P7'),
    ('&#127757; Metro Vancouver &amp; the Lower Mainland', '&#127757; 101-3993 Henning Drive Burnaby BC V5C 6P7'),
    ('&#127757; Metro Vancouver', '&#127757; 101-3993 Henning Drive Burnaby BC V5C 6P7'),
    ('>Serving Metro Vancouver &amp; the Lower Mainland since 1995</span>', '>101-3993 Henning Drive Burnaby BC V5C 6P7</span>'),
    ('>Serving Metro Vancouver &amp; the Lower Mainland</span>', '>101-3993 Henning Drive Burnaby BC V5C 6P7</span>'),
    ('>Metro Vancouver &amp; the Lower Mainland since 1995</span>', '>101-3993 Henning Drive Burnaby BC V5C 6P7</span>'),
    ('>Metro Vancouver &amp; the Lower Mainland</span>', '>101-3993 Henning Drive Burnaby BC V5C 6P7</span>'),
    ('>Book Service</a>', '>Book Now</a>'),
    ('>Book Service</span>', '>Book Now</span>'),
    ('>Book a Service</a>', '>Book Now</a>'),
    ('>Book Online</a>', '>Book Now</a>'),
    ('>Book a Free Consultation</a>', '>Book Now</a>'),
    ('>Book Free Rebate Consultation</a>', '>Book Now</a>'),
    ('>Get a Commercial Quote</a>', '>Book Now</a>'),
    ('>Request a Commercial Quote</a>', '>Book Now</a>'),
    ('>Request a Quote</a>', '>Book Now</a>'),
    ('>Request a Free Quote</a>', '>Book Now</a>'),
    ('>Get a Free Tankless Quote</a>', '>Book Now</a>'),
    ('>Schedule a Tune-Up</a>', '>Book Now</a>'),
    ('>Schedule Service</a>', '>Book Now</a>'),
    ('>Request a Commercial Quote</span>', '>Book Now</span>'),
    ('>Get a Commercial Quote</span>', '>Book Now</span>'),
    ('>Request a Quote</span>', '>Book Now</span>'),
    ('>Book a Free Consultation</span>', '>Book Now</span>'),
    ('>Get a Free Tankless Quote</span>', '>Book Now</span>'),
    ('>Request a Free Quote</span>', '>Book Now</span>'),
]

root = Path('.').resolve()
html_files = list(root.rglob('*.html'))
modified = []
for path in html_files:
    text = path.read_text(encoding='utf-8')
    new_text = text
    for old, new in replacements:
        new_text = new_text.replace(old, new)
    if new_text != text:
        path.write_text(new_text, encoding='utf-8')
        modified.append(str(path.relative_to(root)))

print('Modified files:', len(modified))
for p in modified:
    print(p)
