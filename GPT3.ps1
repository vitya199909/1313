#Перевірка ємкості на диску
$disk = Get-PSDrive -PSProvider FileSystem

# вираховування 10% вільного місця на диску
$10percent = [math]::Round(($disk | Measure-Object -Property Free, Used -Sum).Sum / 10)

#порівнювання вільного місця на диску з 10% вільного місця
if ($disk.Free -lt $10percent) {
    #виведення попередження в файл на робочому столі
    $warning = "Попередження: на диску залишилося менше 10% вільного місця!"
    Write-Host $warning -ForegroundColor Yellow
    $warning | Out-File -FilePath "$env:USERPROFILE\Desktop\Warning.txt"
} else {

    write-host "На диску достатньо вільного місця" -ForegroundColor Green

}
