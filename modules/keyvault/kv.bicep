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

output kvid string = keyvault.id
output kvname string = keyvault.name
