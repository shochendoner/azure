 $subName = "Pay-As-You-Go Dev/Test"
 $rgName = "Network-DEV-rg"
 $vNetName = "SPHEREBOARD-DEV-VNET"
 $DNSIPs = "10.1.0.46", "10.1.0.6", "10.10.1.200", "10.10.0.4" #Modify as necessary.
      Login-AzureAccount
 Select-AzureSubscription -SubscriptionName $subName
      $vnet = Get-AzureVirtualNetwork -ResourceGroupName $rgName -name $vNetName
      $vnet.DhcpOptions.DnsServers = $null
      foreach ($IP in $DNSIPs)
 {
 $vnet.DhcpOptions.DnsServers += $IP
 }
Set-AzureVirtualNetwork -VirtualNetwork $vnet