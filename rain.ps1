$vm = Get-AzVm -Name "CAC01-SPHDEMO" -ResourceGroupName "SPHEREUS"
$VM.NetworkProfile.NetworkInterfaces.Item(0).primary = $true
Update-AzVM -ResourceGroupName "SPHEREUS" -VM $VM