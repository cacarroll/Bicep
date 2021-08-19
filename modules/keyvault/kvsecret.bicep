param kvName string
param secretName string
param secretValue string

resource kvsecret 'Microsoft.KeyVault/vaults/secrets@2019-09-01' = {
  name: '${kvName}/${secretName}'
  properties: {
    value: secretValue
  }
}
