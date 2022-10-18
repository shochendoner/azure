$templateFile = ".\azuredeploy.uat.json"
$parameterFile = ".\param\SB11-UAT.azuredeploy.parameters.json"
$rgname = "Network-UAT-rg"
New-AzResourceGroupDeployment `
  -Name SB06-uatday2 `
  -ResourceGroupName $rgname `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile