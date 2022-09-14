
Import-csv '.\vmdisks.csv' | ForEach-Object {
    $VM = Get-AzVM -ResourceGroupName $_.rgName -Name $_.vmName
    $snapshot = New-AzSnapshotConfig `-SourceUri $vm.StorageProfile.OsDisk.ManagedDisk.Id -Location 'eastus' -CreateOption copy

    New-AzSnapshot -Snapshot $snapshot -SnapshotName $_.ssname -ResourceGroupName $_.rgName
}    
   
 



