$templateFile = ".\azuredeploy.json"
$parameterFile = ".\param\SB11-UAT.azuredeploy.parameters.json"
$rgname = "SPHEREUS"
New-AzResourceGroupDeployment `
  -Name sb25-uatmove02 `
  -ResourceGroupName $rgname `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile