param kvName string
param enabledForTemplateDeployment bool
param kvsku object
param tenantId string


resource keyvault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: kvName
  location: resourceGroup().location
  properties: {
    tenantId: tenantId
    enabledForTemplateDeployment: enabledForTemplateDeployment
    sku: kvsku
  }
}

output kvid string = keyvault.id
