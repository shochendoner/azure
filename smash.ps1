$VMName = "CAC01-SPHDEMO"
$resourceGroup = "SPHEREUS"
$Vnic = Get-AzNetworkInterface -Name 'cac01-sphdemo880' -ResourceGroupName $resourceGroup


$VM = Get-AzVM -Name $VMName -ResourceGroupName $resourceGroup
Write-Warning "Removing the old NIC interface from the VM: $VMName"
Remove-AzVMNetworkInterface -vm $VM -NetworkInterfaceIDs $vNic.Id


Add-AzVMNetworkInterface