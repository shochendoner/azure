$File = '.\ravensvms.csv'
Import-Csv -Path $File | ForEach-Object {

$resourceGroup = 'Baltimore-ravens-rg'
$location = 'eastus'

$vmName =$_.VMNAME
$vnetSubnet =$_.Subnet
$vmDiskName = (''+$vmName.ToLower()+'_OsDisk')
$vmDiskSize = '30'
$vmDiskaccountType = 'Standard_LRS'

#$vmAvailabilitySet = Get-AzAvailabilitySet -ResourceGroupName Servers -Name MyAvailabilitySet
$vnet = Get-AzVirtualNetwork -Name 'Ravens-VNET' -ResourceGroupName Baltimore-ravens-rg
$SubnetID = Get-AzVirtualNetworkSubnetConfig -Name $vnetSubnet -VirtualNetwork $vnet
$tags += @{Servers="Virtual Machine"}

# Create a public IP address and specify a DNS name
# If you don't need a public IP, comment out this line
#$pip = New-AzPublicIpAddress -ResourceGroupName $resourceGroup -Location $location  -Name "$vmName" -AllocationMethod Static -IdleTimeoutInMinutes 4

# Create an inbound network security group rule for port 3389
# If you don't need an NSG, comment out the 'nsg' variable line
#$nsgRuleRDP = New-AzNetworkSecurityRuleConfig -Name AllowRDP -Protocol Tcp -Direction Inbound -Priority 100 -SourceAddressPrefix * -SourcePortRange * -DestinationAddressPrefix * -DestinationPortRange 3389 -Access Allow

# Create a network security group
#$nsg = New-AzNetworkSecurityGroup -ResourceGroupName $resourceGroup -Location $location -Name $vmName -SecurityRules $nsgRuleRDP

# For a virtual network card and associate with public IP address and NSG, use the first line.
# If you don't require a public IP and a NSG, use the second line
#$nic = New-AzNetworkInterface -Name $vmName -ResourceGroupName $resourceGroup -Location $location -SubnetId $SubnetID.Id -PublicIpAddressId $pip.Id -NetworkSecurityGroupId $nsg.Id
$nic = New-AzNetworkInterface -Name $vmName -ResourceGroupName $resourceGroup -Location $location -SubnetId $SubnetID.Id

# Create a virtual machine configuration
$vmConfig = New-AzVMConfig -VMName $vmName -VMSize Standard_B1s | Set-AzVMOperatingSystem -Windows -ComputerName $vmName | Set-AzVMSourceImage -PublisherName MicrosoftWindowsServer -Offer WindowsServer -Skus 2019-Datacenter-smalldisk -Version latest | Add-AzVMNetworkInterface -Id $nic.Id


# Specify VM OsDisk name
Set-AzVMOSDisk -CreateOption fromImage -VM $vmConfig -Name $vmDiskName -DiskSizeInGB $vmDiskSize -Caching ReadWrite -StorageAccountType $vmDiskaccountType -Windows

# Create the virtual machine
New-AzVM -ResourceGroupName $resourceGroup -Location $location -VM $vmConfig
}