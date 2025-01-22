
$in = Read-Host -Prompt "Вкажіть шлях ЗВІДКИ потрібно скопіювати файли: "

$out = Read-Host -Prompt "Вкажіть шлях КУДИ потрібно скопіювати файли: "
# Перевірка на існування папок
$checkin = Test-Path $in
$checkout = Test-Path $out
if($checkin -eq $False) {
    "Помилка: папки не існує"
}elseif($checkout -eq $False) {
    "Помилка: папки не існує"
    "Створити папку? (y/n)"
    $answer = Read-Host
}

if($answer -eq "y") {
    # Створення папки в тихому режимі
    New-Item -Path $out -ItemType Directory -Force | Out-Null
    "Папка створена"
    # Копіювання файлів з переіменування кінцевого файлу на поточну дату в форматі ddMMyyyy і дата має бути до розширення файлу
    $files = Get-ChildItem $in
    $files | Copy-Item -Destination $out
    $dates = Get-Date
    foreach($file in $files) {
        $newname = $file.BaseName + $dates.ToString("ddMMyyyy") + $file.Extension
        $destinationFile = Join-Path -Path $out -ChildPath $file.Name
        Rename-Item -Path $destinationFile -NewName (Join-Path -Path $out -ChildPath $newname)
        "Файли скопійовано"
        "Список скопійованих файлів:"
        $files | ForEach-Object { $_.Name }
    }
    }else {$answer -eq "n"
        "Папка не створена"
    }


<# це те що написав джіпіті) не працює))
# Запитуємо шляхи
$in = Read-Host -Prompt "Вкажіть шлях ЗВІДКИ потрібно скопіювати файли"
$out = Read-Host -Prompt "Вкажіть шлях КУДИ потрібно скопіювати файли"

# Перевірка на існування папок
$checkin = Test-Path $in
$checkout = Test-Path $out

if (-not $checkin) {
    Write-Host "Помилка: Папки-джерела не існує!" -ForegroundColor Red
    return
}

if (-not $checkout) {
    Write-Host "Помилка: Папки-призначення не існує!" -ForegroundColor Red
    $answer = Read-Host -Prompt "Створити папку? (y/n)"
    if ($answer -eq "y") {
        # Створення папки
        New-Item -Path $out -ItemType Directory -Force | Out-Null
        Write-Host "Папка $out успішно створена!" -ForegroundColor Green
    } elseif ($answer -eq "n") {
        Write-Host "Папка не створена. Операція перервана." -ForegroundColor Yellow
        return
    } else {
        Write-Host "Невірна відповідь. Операція перервана." -ForegroundColor Red
        return
    }
}

# Копіюємо файли
$files = Get-ChildItem -Path $in -File
if ($files.Count -eq 0) {
    Write-Host "У папці-джерелі немає файлів для копіювання." -ForegroundColor Yellow
    return
}

foreach ($file in $files) {
    # Копіюємо файл
    Copy-Item -Path $file.FullName -Destination $out

    # Додаємо дату до імені файлу
    $newname = $file.BaseName + $dates.ToString("ddMMyyyy") + $file.Extension
    $destinationFile = Join-Path -Path $out -ChildPath $file.Name
    Rename-Item -Path $destinationFile -NewName (Join-Path -Path $out -ChildPath $newname)
}

# Виводимо список скопійованих файлів
Write-Host "Файли успішно скопійовано до $out!" -ForegroundColor Green
Write-Host "Список скопійованих файлів:" -ForegroundColor Cyan
Get-ChildItem -Path $out -File | ForEach-Object { $_.Name }
#>