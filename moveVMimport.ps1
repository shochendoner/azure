$csv = Import-csv -Path '.\vms.csv' 


ForEach ($VM in $csv) {
    $OriginalResourceGroup=$VM.rg
    $OriginalvmName=$VM.vmname
    $NewVnetName=$VM.newvnetname
    $NewSubnet=$VM.subnet
    $NewvmName=$VM.vmname
    $NewVnetResourceGroup=$VM.newvnetrg
    $NewSubnet=$VM.subnet
}
