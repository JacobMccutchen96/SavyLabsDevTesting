#Computer name and OS Version save and display to variable
$info = Get-ComputerInfo | Select-Object CsDNSHostName, OsVersion
$info


#Save all info into the variable, then display variable  and sort to specific info
#Will display as string value instead of object values
#$info = Get-ComputerInfo
#$info.CsDNSHostName
#$info.OsVersion


