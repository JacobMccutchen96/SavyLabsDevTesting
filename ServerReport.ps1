#Computer name and OS Version save and display to variable
$Computerinfo = Get-ComputerInfo | Select-Object CsDNSHostName, OsVersion
$Computerinfo
#Get Disk info. No specific info for number of drives, use global count method for listed items
$DiskInfo = Get-Disk
$DiskInfo.count



#Save all info into the variable, then display variable  and sort to specific info
#Will display as string value instead of object values
#$info = Get-ComputerInfo
#$info.CsDNSHostName
#$info.OsVersion


