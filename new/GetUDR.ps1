$vnet = Get-AzVirtualNetwork -Name 'SphereUS-Vnet' -ResourceGroupName 'SPHEREUS'
Get-AzVirtualNetworkSubnetConfig -Name 'ConfluenceAGW-Subnet' -VirtualNetwork $vnet