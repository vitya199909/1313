$logFile = "files.log"
for ($i = 0; $i -lt 5; $i++) {
    $fileName = "file$i.txt"
    New-Item -ItemType File -Name $fileName -Force | Out-Null
    $logMessage = "The file '$fileName' has been created"
    Add-Content -Path $logFile -Value $logMessage
}
Get-Content -Path $logFile
Write-Output ""