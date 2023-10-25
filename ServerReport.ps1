#Computer name save and display to variable
$info = Get-ComputerInfo | Select-Object CsDNSHostName
$info

