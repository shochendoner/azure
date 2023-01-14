##
##$DomainName = "12sphere.org"
#$VMName = "Offense-0"
#$credential = Get-Credential "steveadmin@12sphere.org"
#$ResourceGroupName = "Steve-test-rg"
 
#Set-AzVMADDomainExtension -DomainName $DomainName -VMName $VMName -Credential $credential -ResourceGroupName $ResourceGroupName -JoinOption 0x00000001 -Restart -Verbo

# Create a Resource Group and Virtual Machine before this.
$extensionName = "stevedomainjoin"
$virtualMachineName = "Offense-3"
$resourceGroupName = "Steve-test-rg"
$domainName = "12sphere.org"
Set-AzVMADDomainExtension -ResourceGroupName $resourceGroupName -VMName $virtualMachineName -Name $extensionName -DomainName $domainName

