<<<<<<< HEAD
$templateFile = "F:\repos\azure\new\param\azuredeploy.sales.json"
$parameterFile = "F:\repos\azure\new\param\sales\SLP01-demo.azuredeploy.parameters.json"
$rgname = "SB"
=======
$templateFile = ".\azuredeploy.sales.json"
$parameterFile = ".\param\SB04-DEMO.azuredeploy.parameters.json"
$rgname = "SB-SALES-rg"
>>>>>>> 2b077f7cb504b54c23ebcce452e7f2e9a9b935f2
New-AzResourceGroupDeployment `
  -Name slp01move `
  -ResourceGroupName $rgname `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile