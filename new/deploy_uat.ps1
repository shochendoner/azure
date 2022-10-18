$templateFile = ".\azuredeploy.uat.json"
$parameterFile = ".\param\SB16-UAT.azuredeploy.parameters.json"
$rgname = "Network-UAT-rg"
New-AzResourceGroupDeployment `
  -Name saturdaystuffUAT `
  -ResourceGroupName $rgname `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile