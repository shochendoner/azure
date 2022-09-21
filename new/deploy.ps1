$templateFile = ".\azuredeploy.json"
$parameterFile = ".\param\SB05-demo.azuredeploy.parameters.json"
$rgname = "SB"
New-AzResourceGroupDeployment `
  -Name SB05DemoMove02 `
  -ResourceGroupName $rgname `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile