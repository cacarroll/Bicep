param kvName string
param enabledForTemplateDeployment bool
param kvsku object

resource keyvault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: kvName
  location: resourceGroup().location
  properties: {
    enabledForTemplateDeployment: enabledForTemplateDeployment
    sku: {
      sku: kvsku
    }
  }
}

output kvid string = keyvault.id
