$RANDO=0 

$Logfile = "C:\Users\colto\Documents\GitHub\it3038c-scripts\PowerShell\rando.log"

for($i=0; $i -lt 5; $i++){ 

    $RANDO=Get-Random -Maximum 1000 -Minimum 1 

    Write-Host($RANDO) 

    Add-Content $LogFile "INFO: Random number is ${RANDO}" 

} 