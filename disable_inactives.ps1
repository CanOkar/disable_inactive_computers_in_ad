Import-Module ActiveDirectory
$time = (Get-Date).adddays(-90)
$inactive_computers = Get-ADComputer -Filter {lastLogonTimestamp -lt $time} | Select-Object name

foreach($inactive_computer in $inactive_computers)
{

Set-ADComputer -Identity $inactive_computer.name -Enabled $false

}
$inactive_computers > c:\disabled_computers.txt
