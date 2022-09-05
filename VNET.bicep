resource virtualNetwork 'Microsoft.Network/virtualNetworks@2019-11-01' = {
  name: 'SPHEREBOARD-DEV-VNET'
  location: 'eastus'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.20.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'default'
        properties: {
          addressPrefix: '10.20.2.0/24'
        }
      }
      {
        name: 'Subnet-01'
        properties: {
          addressPrefix: '10.20.3.0/24'
        }
      }
    ]
  }
}
