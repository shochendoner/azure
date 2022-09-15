$id = (Get-AzTemplateSpec -Name DeveloperVM-TemplateSpec -ResourceGroupName Shared-DEV-rg -Version 1.0a).Versions.Id

New-AzResourceGroupDeployment `
  -TemplateSpecId $id `
  -ResourceGroupName 'Network-UAT-rg' `
  -StorageAccountType Standard_GRS