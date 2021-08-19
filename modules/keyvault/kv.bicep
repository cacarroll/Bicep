param kvName string
param enabledForTemplateDeployment bool
param enableRbacAuthorization bool
param kvsku object
param tenantId string

resource keyvault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: kvName
  location: resourceGroup().location
  properties: {
    tenantId: tenantId
    enabledForTemplateDeployment: enabledForTemplateDeployment
    enableRbacAuthorization: enableRbacAuthorization
    sku: kvsku
  }
}

// resource subnetacrpvt 'Microsoft.Network/virtualNetworks/subnets@2020-11-01' existing = {
//   scope: resourceGroup().location
//   name: '${vnetspoke.name}/default'
//   // parent: vnetspoke
// }


// module pvtEndpoint '../vnet/privateendpoint.bicep' = {
//   scope: resourceGroup().location
//   name: '${kvName}-Endpoint'
//   params: {
//     privateEndpointName: '${kvName}-Endpoint'
//     privateLinkServiceConnections: [
//       {
//         name: '${kvName}-EndpointConnection'
//         properties: {
//           privateLinkServiceId: acrDeploy.outputs.acrid
//           groupIds: [
//             'vault'
//           ]
//         }
//       }
//     ]
//     subnetid: {
//       id: subnetacrpvt.id
//     }
//   }
// }

output kvid string = keyvault.id
output kvname string = keyvault.name
