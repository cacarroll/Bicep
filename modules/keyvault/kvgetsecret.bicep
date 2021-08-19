targetScope = 'subscription'

// query the existing keyvault resource
resource rKeyVault 'Microsoft.KeyVault/vaults@2019-09-01' existing = {
  name: 'keyvaultjumpbox'
  scope: resourceGroup('kvtest')
}

