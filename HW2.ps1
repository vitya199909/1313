param(
    [Parameter(Mandatory=$true)]
    [string]$InputString
)
$words = $InputString -split ' '
foreach ($word in $words) {
    Write-Output $word
}