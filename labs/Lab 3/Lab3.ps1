##clear the working terminal
clear

##Modified getIP to display ONLY my wifi IP Address and not my Ethernet IP Address
function getIP{
    (get-netipaddress -InterfaceAlias Wi-fi).ipv4address | Select-String "192*"
}

function getDate{
    Get-Date -DisplayHint Date -Format "dddd, MMMM dd, yyyy"
}

$IP = getIP
##This is an environment variable
$User = $env:Username
$ver = $Host.Version.Major
##Cannot use the variable $HOST since it already exists and is read-only or constant. Modified to $HOSTNAME
$HOSTNAME = hostname
$CURRENTDATE = getDate

$BODY = "This machine's IP is $IP. User is $User. Hostname is $HOSTNAME. PowerShell $ver. Today's Date is $CURRENTDATE."

write-host($BODY)

Send-MailMessage -To "daltonco@ucmail.uc.edu" -From "colton.dalton123@gmail.com" -Subject "IT3038C Windows SysInfo" -Body $BODY -SmtpServer smtp.gmail.com -port 587 -UseSSL -Credential (Get-Credential) 