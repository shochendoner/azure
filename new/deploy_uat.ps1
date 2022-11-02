$templateFile = ".\azuredeploy.uat.json"
$parameterFile = ".\azuredeploy.parameters.json"
$rgname = "Network-Corp-rg"
New-AzResourceGroupDeployment `
  -Name Corpvnet `
  -ResourceGroupName $rgname `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile