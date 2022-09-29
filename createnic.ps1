$VMs = Import-csv -path '.\new\ravensvms.csv'

foreach ($VMName in $VMs){
    New-AzNetworkInterface -Name $VMs.nic -ResourceGroupName $VMs.RGname -Location "eastus" -SubnetId $VMs.subnet -IpConfigurationName "IPConfiguration1" -PublicIpAddressId 'None' 
}


