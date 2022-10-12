$templateFile = ".\azuredeploy.uat.json"
$parameterFile = ".\param\SB04-UAT.azuredeploy.parameters.json"
$rgname = "Network-UAT-rg"
New-AzResourceGroupDeployment `
  -Name UATmove02 `
  -ResourceGroupName $rgname `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile