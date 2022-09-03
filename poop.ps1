$VirtualMachine = Get-AzVM -ResourceGroupName "SPHEREUS" -Name "CAC01-SPHDEMO"
Add-AzVMNetworkInterface -VM $VirtualMachine -Id "/subscriptions/738ed618-66b1-437e-a2af-768880a84417/resourceGroups/SPHEREUS/providers/Microsoft.Network/networkInterfaces/CAC01nic"
Update-AzVM -ResourceGroupName "SPHEREUS" -VM $VirtualMachine