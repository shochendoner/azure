# Initialise environment and variables

# Declare endpoint


## Login
Connect-AzAccount -Subscription "Cloud Infrastructure"

# Get location of Azure Stack Hub
$Location = (Get-AzLocation).Location

# Input Variables
$RGName = "cloud-test-rg02"
$VMName = "testvm03"
$NewNetworkName = "cloud-test--vnet01"
$NewSubnetName = "test-vnet02"
$NewPrivateIp = "10.1.0.5"
$NewNicName = 'testvm03-nic01'

# Retrieve VM details
$VM = Get-AzVM -Name $VMName -ResourceGroupName $RGName

# Check if the VM uses managed or unmanaged disks
if ($VM.StorageProfile.OsDisk.ManagedDisk) {
    $ManagedDisks = $true
}
else {
    $ManagedDisks = $false
}

# Stop the VM
Stop-AzVM -Name $VMName -ResourceGroupName $RGName -Force

# Get VM current networking details
$Nic = (Get-AzNetworkInterface | Where-Object -FilterScript { $_.VirtualMachine.Id -like $VM.Id })

# Get new virtual network details
$NewVNet = Get-AzVirtualNetwork | Where-Object -FilterScript { $_.Name -like $NewNetworkName }
$NewSubnet = Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $NewVNet -Name $NewSubnetName

# Create new VM networking resources
$NewIpConfig = New-AzNetworkInterfaceIpConfig -Subnet $NewSubnet -Name "ipconfig2" -Primary -PrivateIpAddress $NewPrivateIp -PublicIpAddress $NewPublicIp
$NewNic = New-AzNetworkInterface -Name $NewNicName -ResourceGroupName $NewVNet.ResourceGroupName -Location $NewVNet.Location -IpConfiguration $NewIpConfig -NetworkSecurityGroupId $Nic.NetworkSecurityGroup.Id -Force

# Retrieve VM data disk details
if ($VM.StorageProfile.DataDisks) {
    $Lun = 0
    if ($ManagedDisks) {
        $Disks = Get-AzDisk -ResourceGroupName $RGName | Where-Object -FilterScript { $_.ManagedBy -like "*$VMName" } | Where-Object -FilterScript { $_.Id -notlike $VM.StorageProfile.OsDisk.ManagedDisk.Id }
    }
    else {
        $Disks = $VM.StorageProfile.DataDisks
    }
}

# Create new VM configuration
$NewVmConfig = New-AzVMConfig -VMName $VMName -VMSize $VM.HardwareProfile.VmSize

if ($ManagedDisks) {
    # Add OS disk to new VM configuration
    if ($VM.StorageProfile.OsDisk.OsType -eq "Windows") {
        $NewVmConfig = Set-AzVMOSDisk -VM $NewVmConfig -ManagedDiskId $VM.StorageProfile.OsDisk.ManagedDisk.Id -CreateOption "Attach" -Windows
    }
    else {
        $NewVmConfig = Set-AzVMOSDisk -VM $NewVmConfig -ManagedDiskId $VM.StorageProfile.OsDisk.ManagedDisk.Id -CreateOption "Attach" -Linux
    }
    # Add data disk(s) to new VM configuration
    foreach ($Disk in $Disks) {
        $NewVmConfig = Add-AzVMDataDisk -VM $NewVmConfig -ManagedDiskId $Disk.Id -CreateOption "Attach" -Lun $Lun -DiskSizeInGB $Disk.DiskSizeGB
        $Lun++
    }
}
else {
    # Add OS disk to new VM configuration
    if ($VM.StorageProfile.OsDisk.OsType -eq "Windows") {
        $NewVmConfig = Set-AzVMOSDisk -VM $NewVmConfig -VhdUri $VM.StorageProfile.OsDisk.Vhd.Uri -CreateOption Attach -Name $VM.StorageProfile.OsDisk.Name -Windows
    }
    else {
        $NewVmConfig = Set-AzVMOSDisk -VM $NewVmConfig -VhdUri $VM.StorageProfile.OsDisk.Vhd.Uri -CreateOption Attach -Name $VM.StorageProfile.OsDisk.Name -Linux
    }
    # Add data disk(s) to new VM configuration
    foreach ($Disk in $Disks) {
        $NewVmConfig = Add-AzVMDataDisk -VM $NewVmConfig -Name $Disk.Name -CreateOption "Attach" -Lun $Lun -DiskSizeInGB $Disk.DiskSizeGB
        $Lun++
    }
}

# Add new NIC to new VM configuration
$NewVmConfig = Add-AzVMNetworkInterface -VM $NewVmConfig -NetworkInterface $NewNic

# Remove the old VM
Write-Output -InputObject "Removing old virtual machine"
Remove-AzVM -Name $VMName -ResourceGroupName $RGName -Force

# Create the new VM from the new VM configuration
Write-Output -InputObject "Creating new virtual machine"
New-AzVM -VM $NewVmConfig -ResourceGroupName $NewVNet.ResourceGroupName -Location $NewVNet.Location
Get-AzVM -ResourceGroupName $RGName -Name $VMName
Write-Output -InputObject "The virtual machine has been created successfully"