##Clear the terminal
Clear

##Report back system information. This includes hostname, device specs, and Mac addresses.

##Hostname
$HOSTNAME = hostname
$outputHostname = "Device Name: $HOSTNAME"
Write-Host($outputHostname)
Write-Host("")

##Device Specs
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

##Windows Updates
Get-WindowsUpdate -AcceptAll -Install