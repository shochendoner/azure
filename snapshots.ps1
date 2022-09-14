$SS = Import-csv '.\vmdisks.csv' 
$resourceGroupName = $SS.rgname 
$location = 'eastus' 
$vmName = $SS.vmName 
$snapshotName = $SS.ssname


$Imports = import-csv .\vmdisks.csv
$SS=   foreach ($VM in $Imports){
#Get the VM
Get-AzVM -ResourceGroupName $resourceGroupName -Name $vmName

#Create the snapshot configuration
$snapshot =  New-AzSnapshotConfig -SourceUri $vm.StorageProfile.OsDisk.ManagedDisk.Id -Location $location -CreateOption copy

#Take the snapshot
New-AzSnapshot -Snapshot $snapshot -SnapshotName $snapshotName -ResourceGroupName $resourceGroupName 

}