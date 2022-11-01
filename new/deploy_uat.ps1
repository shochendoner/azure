$templateFile = ".\azuredeploy.uat.json"
$parameterFile = ".\azuredeploy.parameters.json"
$rgname = "Network-Cloud-rg"
New-AzResourceGroupDeployment `
  -Name SB06-uatday2 `
  -ResourceGroupName $rgname `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile