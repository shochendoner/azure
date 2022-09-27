# Get Azure Application Gateway
$appgw=Get-AzApplicationGateway -Name "confluencedc-qa-appgateway" -ResourceGroupName "SphereUS"
 
# Stop the Azure Application Gateway
Stop-AzApplicationGateway -ApplicationGateway $appgw
 
# Start the Azure Application Gateway
Start-AzApplicationGateway -ApplicationGateway $appgw