$templateFile = "F:\repos\azure\new\param\azuredeploy.sales.json"
$parameterFile = "F:\repos\azure\new\param\sales\SLP01-demo.azuredeploy.parameters.json"
$rgname = "SB"
New-AzResourceGroupDeployment `
  -Name slp01move `
  -ResourceGroupName $rgname `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile