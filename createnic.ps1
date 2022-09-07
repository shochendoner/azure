$VMs = Import-csv -path '.\vms.csv' 
$nicname = $VMs.VMname + "-nic01"
foreach ($VMName in $VMs){
    $nicname = $VMs.VMname + "-nic01"
    New-AzNetworkInterface -Name $nicname -ResourceGroupName $VMs.RGname -Location "eastus" -SubnetId $VMs.subnet -IpConfigurationName "IPConfiguration1" -PublicIpAddressId 'None' 
}