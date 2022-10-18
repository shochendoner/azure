$templateFile = ".\param\azuredeploy.sales02.json"
$parameterFile = ".\param\SALES\salesextra.parameters.json"
$rgname = "Network-sales-rg"
New-AzResourceGroupDeployment `
  -Name week2sales `
  -ResourceGroupName $rgname `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile