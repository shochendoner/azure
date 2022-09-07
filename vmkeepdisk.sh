RG = 'cloud-test-rg02'
VM = 'LamarJackson-VM'
az resource update --resource-group 'sphereus' --name 'SPHEREExch2010' --resource-type virtualMachines --namespace Microsoft.Compute --set properties.storageProfile.osDisk.deleteOption=detachw