#Computer name and OS Version save and display to variable - Later moved to custom object.
$Computerinfo = Get-ComputerInfo | Select-Object
#$Computerinfo
#Get Disk info. No specific info for number of drives, use global count method for listed items
$DiskInfo = Get-Disk
#$DiskInfo.count

#GetFreeSystemSpace
$FreeSpace = Get-PSDrive | where-object {$_.name -eq 'C'}

#Get Number of CPU Cores
$CPUCore = Get-CimInstance CIM_Processor

#DHCP Server
$DHCPHost = Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true"

#Get total Memory
#Will find total amount of DIMMs and run foreach loop to corresponding number
$RAM = Get-CimInstance CIM_PhysicalMemory
$RAMSum = 0
foreach ($item in $RAM) {
    $RAMSum = $RAMSum + $item.capacity
}

Write-Output $RAMSum

#Making custom object to display all info at once, more neatly
#Removing the dual select from $computerinfo and will specify in the custom object instead
$obj = [PSCustomObject]@{
    #Name = Value.
    #Name will be the displayed column name
    ComputerName = $ComputerInfo.CsDNSHostName
    ComputerOS = $ComputerInfo.OsVersion
    LogicalDiskCount =  $DiskInfo.count
    FreeSpace_GB = [System.Math]::Round(($FreeSpace.Free /1Gb),2)
    CPU_Cores = $CPUCore.NumberOfCores
    RAM_Total = [System.Math]::Round(($RAMSum /1Gb),2)
    DHCP_Host = $DHCPHost.DHCPServer
}
Write-Output $obj


#Save all info into the variable, then display variable  and sort to specific info
#Will display as string value instead of object values
#$info = Get-ComputerInfo
#$info.CsDNSHostName
#$info.OsVersion


