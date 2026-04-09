param([string]$Path)
$text = Get-Content -Raw $Path
$patterns = @(
    @{pat='(>)(?:Book Service in|Book Now )[^<]+(</a>)'; rep='$1Book Now$2'},
    @{pat='(>)(?:Request an Installation Quote|Get a Commercial Quote) &#8594;(</a>)'; rep='$1Book Now$2'}
)
$new = $text
foreach ($p in $patterns) {
    $new = $new -replace $p.pat, $p.rep
}
if ($new -ne $text) { $new | Set-Content -Path $Path }
