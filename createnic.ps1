$VMs = Import-csv -path '.\vms.csv'

foreach ($VMName in $VMs){
    New-AzNetworkInterface -Name $VMs.nic -ResourceGroupName 'Network-Corp-rg' -Location "eastus" -SubnetId "/subscriptions/738ed618-66b1-437e-a2af-768880a84417/resourceGroups/Network-Corp-rg/providers/Microsoft.Network/virtualNetworks/CorporateResources-VNET/subnets/default" -IpConfigurationName "IPConfiguration1" -PublicIpAddressId 'None' 
}


