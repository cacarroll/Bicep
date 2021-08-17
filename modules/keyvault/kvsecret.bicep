

resource kvsecret 'Microsoft.KeyVault/vaults/secrets@2019-09-01' = {
  name: '${key_vault.name}/my-test-secret'
  properties: {
    attributes: {
      enabled: true
    }
  }
}
