$templateFile = ".\azuredeploy.uat.json"
$parameterFile = ".\azuredeploy.parameters.json"
$rgname = "Network-QA-rg"
New-AzResourceGroupDeployment `
  -Name sphereboardQA `
  -ResourceGroupName $rgname `
  -TemplateFile $templateFile `
  -TemplateParameterFile $parameterFile