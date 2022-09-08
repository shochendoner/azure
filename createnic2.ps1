$nics = import-csv '.\vms.csv'

$nics | ForEach-Object {
    New-AzNetworkInterface -Name $_.nic -ResourceGroupName $_.RGname -Location "eastus" -SubnetId $_.subnet -IpConfigurationName "IPConfiguration1"

}