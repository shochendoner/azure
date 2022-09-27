$templateFile = ".\azuredeploy.json"
$parameterFile = ".\param\SB25-UAT.azuredeploy.parameters.json"
$rgname = "Network-UAT-rg"
New-AzResourceGroupDeployment `
  -Name sb25-uatmove02 `
  -ResourceGroupName $rgname `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile