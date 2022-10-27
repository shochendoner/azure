$templateFile = ".\azuredeploy.uat.json"
$parameterFile = ".\azuredeploy.parameters.json"
$rgname = "Target-UAT-rg"
New-AzResourceGroupDeployment `
  -Name SB06-uatday2 `
  -ResourceGroupName $rgname `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile