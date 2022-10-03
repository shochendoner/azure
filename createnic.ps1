$VMs = Import-csv -path '.\vms.csv'

foreach ($VMName in $VMs){
    New-AzNetworkInterface -Name $VMs.nic -ResourceGroupName $VMs.RGname -Location "eastus" -SubnetId $VMs.subnet -IpConfigurationName "IPConfiguration1" -PublicIpAddressId 'None' 
}


