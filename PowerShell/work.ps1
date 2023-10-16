$Machines = ‘localhost’ 

Foreach ($machine in $Machines)  

{ 

$RCounters = Get-Counter -ListSet * -ComputerName $machine 

“There are {0} counters on {1}” -f $RCounters.count, ($machine) 

} 