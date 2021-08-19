param subnetId string

// param vmName string
// param script64 string
param vmsettings object
@secure()
param adminPassword string

// @secure()
// param publicKey string

module jbnic '../vnet/nic.bicep' = {
  name: '${vmsettings.name}nic'
  params: {
    nicName: '${vmsettings.name}nic'
    subnetId: subnetId
  }
}

resource jumpbox2 'Microsoft.Compute/virtualMachines@2020-06-01' = {
  name: vmsettings.name
  location: resourceGroup().location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    osProfile: {
      computerName: vmsettings.name
      adminUsername: vmsettings.osProfile.adminUsername
      adminPassword: adminPassword
      // linuxConfiguration: {
      //   ssh: {
      //     publicKeys: [
      //       {
      //         path: publicKey != null ? '/home/azureuser/.ssh/authorized_keys' : null
      //         keyData: publicKey != null ? publicKey : null 
      //       }
      //     ]
      //   }
      // }
      windowsConfiguration: {
        provisionVMAgent: true
      }
    }
    hardwareProfile: {
      vmSize: vmsettings.hardwareProfile.vmSize
    }
    storageProfile: {
      imageReference: {
        publisher: vmsettings.storageProfile.imageReference.publisher 
        offer: vmsettings.storageProfile.imageReference.offer
        sku: vmsettings.storageProfile.imageReference.sku
        version: vmsettings.storageProfile.imageReference.version
      }
      osDisk: {
        createOption: vmsettings.storageProfile.osDisk.createOption
        managedDisk: {
          storageAccountType: vmsettings.storageProfile.osDisk.managedDisk.storageAccountType
        }
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: jbnic.outputs.nicId
        }
      ]
    }
  }
}

// resource vmext 'Microsoft.Compute/virtualMachines/extensions@2021-03-01' = {
//   name: '${jumpbox.name}/csscript'
//   location: resourceGroup().location
//   properties: {
//     publisher: 'Microsoft.Azure.Extensions'
//     type: 'CustomScript'
//     typeHandlerVersion: '2.1'
//     autoUpgradeMinorVersion: true
//     settings: {}
//     protectedSettings: {
//       script: script64
//     }
//   }
// }
