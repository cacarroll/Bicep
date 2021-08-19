param subnetId string
param nicName string

resource jbnic 'Microsoft.Network/networkInterfaces@2021-02-01' = {
  name: nicName
  location: resourceGroup().location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: subnetId
          }
          privateIPAllocationMethod: 'Dynamic'
        }
      }
    ]
  }
}

output nicName string = jbnic.name
output nicId string = jbnic.id
