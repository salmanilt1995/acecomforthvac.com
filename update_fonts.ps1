# Update all HTML files to use Poppins instead of Roboto
Get-ChildItem -Path . -Recurse -Include *.html | ForEach-Object {
  $content = Get-Content $_.FullName -Raw
  if ($content -match 'family=Roboto') {
    $content = $content -replace 'family=Roboto[^&]*', 'family=Poppins:wght@400;500;600;700;800'
    Set-Content $_.FullName $content
    Write-Host "Updated fonts in $($_.FullName)"
  }
}
