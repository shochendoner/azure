$File = '.\ravensvms.csv'
Import-Csv -Path $File | ForEach-Object {
    $Name =$_.VMNAME
    $ResourceGroupName =$_.RGN
    $Location ='East US'
    $VirtualNetworkName ='Ravens-VNET'
    $SubnetName =$_.Subnet
    $SecurityGroupName=$_.NSG
    $PublicIpAddressName=$_.demoip
    $OpenPorts=$_.OpenPorts

    New-AzVm -ResourceGroupName $ResourceGroupName -Name $Name -Location $Location -VirtualNetworkName $VirtualNetworkName -SubnetName $SubnetName -SecurityGroupName $SecurityGroupName -PublicIpAddressName $PublicIpAddressName -OpenPorts $OpenPorts  

}

$vmConfig = New-AzVMConfig -VMName $vmName -VMSize Standard_B1s | Set-AzVMOperatingSystem -Windows -ComputerName $vmName -Credential $cred 
-TimeZone $timezone | Set-AzVMSourceImage -PublisherName MicrosoftWindowsServer 
-Offer WindowsServer -Skus 2019-Datacenter-smalldisk -Version latest | Add-AzVMNetworkInterface -Id $nic.Id