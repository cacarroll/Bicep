param secretName string
param secretValue string

resource kvsecret 'Microsoft.KeyVault/vaults/secrets@2019-09-01' = {
  name: secretName
  properties: {
    value: secretValue
  }
}
