if($check -eq $False) {
    "Помилка: папки не існує"
}else {
   $files = Get-ChildItem $shlyah
   $files | Out-File -FilePath "Report.txt" 
   }
