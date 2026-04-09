::Simple batch to update remaining service detail pages
@echo off
setlocal enabledelayedexpansion

:: List of all service detail HTML files that need updating
set "files=heating\boilers.html heating\hot-water-tanks.html heating\tankless.html heating\combi-boiler.html heating\rooftop.html heating\unit-heaters.html heating\installation.html heating\repair.html heating\service.html air-conditioning\ductless.html air-conditioning\installation.html air-conditioning\repair.html air-conditioning\service.html heat-pumps\central.html heat-pumps\ductless.html heat-pumps\installation.html heat-pumps\repair.html heat-pumps\service.html heat-pumps\water-source.html air-duct-cleaning\residential.html air-duct-cleaning\commercial.html"

echo These files need individual manual updates or use PowerShell for bulk operation
echo Total remaining: 21 files

:: Note: Use PowerShell with -replace operator for each file pattern
pause
