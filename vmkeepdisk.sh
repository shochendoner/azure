az resource update --resource-group $RG --name $VM --resource-type virtualMachines --namespace Microsoft.Compute --set properties.storageProfile.osDisk.deleteOption=detach