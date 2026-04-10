$f = "d:\xampp\htdocs\projects\acecomforthvac.com\heating\index.html"
$c = Get-Content $f -Raw
$c = $c -replace 'Annual Heating Service Done Right.*Not Just a Checkbox', '<h2>Annual Heating Service Done Right &mdash; Not Just a Checkbox</h2>'
$c = $c -replace 'AI-powered service software available.*every single service call', 'Our licensed heating technicians use the most advanced AI-powered service software available &mdash; every single service call'
$c = $c -replace 'Full Safety Inspection.*We verify', '<li style="display:flex;gap:0.75rem;align-items:flex-start;"><span style="color:var(--orange);font-size:1.1rem;flex-shrink:0;">&#10003;</span><span><strong>Full Safety Inspection</strong> &mdash; We verify'
Set-Content $f $c -Encoding UTF8
Write-Host "Fixed heating/index.html"
