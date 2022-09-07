RG = 'cloud-test-rg02'
VM = 'LamarJackson-VM'
az resource update --resource-group 'sphereus' --name 'AvePointVM01' --resource-type virtualMachines --namespace Microsoft.Compute --set properties.storageProfile.osDisk.deleteOption=detach