﻿$myHashArr = @{Id=1; FirstName="Bob"; "SecondName"="Silver"}#Get array of keysWrite-Host "Array keys: "$myHashArr.Keys -ForegroundColor Green#Get array of valuesWrite-Host "Array values: "$myHashArr[$myHashArr.Keys] -ForegroundColor DarkMagenta# Or use $myHashArr.Values#Set value by key$myHashArr.FirstName = "Sam"#Add key-value$myHashArr["Email"] = "test@gmail.com" #Or $myHashArr.Add("Email","test@gmail.com")#Sort by key$myHashArr.GetEnumerator() | Sort-Object -Property key