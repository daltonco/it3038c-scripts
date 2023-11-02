####Clear the terminal. Changed from 'Clear' to 'Clear-Host' as it is recommended to only use aliases when necessary.
Clear-Host

####Removes temp files from the current profile & empties user's Recycle Bin.
##Refered to: https://github.com/My-Random-Thoughts/Various-Code/blob/master/CleanUserProfileFolders.ps1
##Sets the string variable, $userProfile, to the file path of the currently signed in user profile.
[string]$userProfile = Get-ChildItem -Path (Split-Path -Parent $env:USERPROFILE)
##Array containing the locations of common temp file locations
[array] $paths = (
  '\AppData\Local\Microsoft\Edge\User Data\Service Worker',
  '\AppData\Local\Microsoft\Windows\Temporary Internet Files',
  '\AppData\Local\Microsoft\Windows\WebCache',
  '\AppData\Local\Microsoft\Windows\WER',
  '\AppData\Local\Microsoft\Internet Explorer\Recovery',
  '\AppData\Local\Microsoft\Terminal Server Client\Cache',
  '\AppData\Local\KVS\Enterprise Vault',
  '\AppData\Local\CrashDumps',
  '\AppData\Local\Temp',
  '\AppData\LocalLow\Sun\Java\Deployment\cache\6.0',
  '\AppData\Local\Microsoft\Microsoft.EnterpriseManagement.Monitoring.Console',
  '\AppData\Roaming\Code\Cache',
  '\AppData\Roaming\Code\CachedData',
  '\AppData\Roaming\Code\Code Cache',
  '\AppData\Roaming\Code\logs',
  '\AppData\Roaming\Default\Service Worker',
  '\AppData\Roaming\Default\Cache',
  '\AppData\Roaming\Default\Code Cache'
)
[string]$pathToUser = (Split-Path -Parent $env:USERPROFILE) 
[double]$priorDiskSpace = Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='$($pathToUser.SubString(0,2))'" | Select-Object -ExpandProperty FreeSpace

ForEach ($path in $paths){
  if ((Test-Path -Path "$userProfile\$path") -eq $true){
    Get-ChildItem -Path "$profilePath\$user\$path" -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
  }
}
[double]$currentDiskSpace = Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='$($pathToUser.SubString(0,2))'" | Select-Object -ExpandProperty FreeSpace

Write-Host 'All commonly used temp folders have been emptied. Your available disk space both before and after the deletion are displayed below.'
Write-Output "Before: $(($priorDiskSpace / 1GB).ToString('0.00')) GB"
Write-Output "After : $(($currentDiskSpace / 1GB).ToString('0.00')) GB"
Write-Host 'All items currently stored in the recycle bin of the current user profile are going to be permanently deleted.'
$continue = Read-Host -Prompt 'Is this fine? [Y/N]'
if ($continue -eq 'Y' -or $continue -eq 'y'){
  Clear-RecycleBin -DriveLetter 'C' -Force
  Write-Host 'Your Recycle Bin has been emptied.'
  Write-Host ''
}
else{
  Write-Host 'Your Recylce Bin was not cleared.'
  Write-Host ''
}

####Report back system information. This includes hostname, device specs, and Mac addresses.
##Hostname
$HOSTNAME = hostname
$outputHostname = "Device Name: $HOSTNAME"
Write-Host($outputHostname)
Write-Host("")

###Device Specs
##Get Mac Addresses
$outputMac = "Mac Addresses:"
Write-Host($outputMac)
getmac
Write-Host("")

##CPU, example from https://www.elevenforum.com/t/find-cpu-or-processor-specs-in-windows-11.8438/#Six
$CPUName = wmic path win32_processor get name
$CPUNumCores = wmic path win32_processor get NumberOfCores
$outputCPU = "CPU Info:"
$outputCPU_name = "$CPUName"
$outputCPU_numCores = "$CPUNumCores"
Write-Host($outputCPU)
Write-Host($outputCPU_name)
Write-Host($outputCPU_numCores)
Write-Host("")

##RAM Installed, example from https://www.action1.com/how-to-check-ram-type-with-powershell-on-windows-action1-rmm/
$outputRAM = "RAM Info:"
Write-Host($outputRAM)
Get-WmiObject Win32_PhysicalMemory | Select-Object @{Name="Channel"; Expression={$_.BankLabel}}, @{Name="Capacity (GB)"; Expression={$_.Capacity/1GB}}

Start-Sleep -seconds 1;

####Windows Updates
Get-WindowsUpdate -AcceptAll -Install