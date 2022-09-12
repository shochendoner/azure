$SS = Import-CSV '.\vmdisks.csv'
foreach ($vmName in $SS){
    $resourceGroupName = $vmName.rgname 
    $location = 'EastUS'
    $vmName = $vmName.Vmname
|
    Get-AZVM -Name $vmname -ResourceGroupName $resourceGroupName
    
    $snapshotConfig = New-AzSnapshotConfig -SourceUri $vm.StorageProfile.OsDisk.ManagedDisk.Id -Location $location -CreateOption 'copy' -SkuName 'Standard_LRS'

    $timestamp = Get-Date -Format yyMMddThhmmss
    $snapshotName = ($vmName+$timestamp)

    New-AzSnapshot -Snapshot $snapshotConfig `
                   -SnapshotName $snapshotName `
                   -ResourceGroupName $resourceGroupName
}

