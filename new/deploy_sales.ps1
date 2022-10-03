$templateFile = ".\azuredeploy.sales.json"
$parameterFile = ".\param\SB04-DEMO.azuredeploy.parameters.json"
$rgname = "SB-SALES-rg"
New-AzResourceGroupDeployment `
  -Name sb25-uatmove02 `
  -ResourceGroupName $rgname `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile