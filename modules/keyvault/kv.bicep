param kvName string
param enabledForTemplateDeployment bool
param sku object

resource keyvault 'Microsoft.KeyVault/vaults@2019-09-01' = {
  name: kvName
  location: resourceGroup().location
  sku: {
    sku: sku
  }
  properties: {
    enabledForTemplateDeployment: enabledForTemplateDeployment
  }
}

output kvid string = keyvault.id
