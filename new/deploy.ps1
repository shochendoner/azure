$templateFile = ".\new\azuredeploy.json"
$parameterFile = ".\new\azuredeploy.parameters2.json"
$rgname = "cloud-ravens"
New-AzResourceGroupDeployment `
  -Name UATMove `
  -ResourceGroupName $rgname `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile