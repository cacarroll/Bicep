$location = 'usgovvirginia'
$bicepFile = 'kvtest.bicep'
$kvName = 'keyvaultjumpbox'
$resourceGroupName = 'kvtest'
$parameterFile = ".\parameters.json"


Remove-AzKeyVault -Name $kvName -ResourceGroupName $resourceGroupName -Force
Remove-AzKeyVault -Name 'keyvaultkubernetes' -ResourceGroupName $resourceGroupName -Force
Remove-AzKeyVault -Name $kvName -InRemovedState -Location $location -Force
Remove-AzKeyVault -Name 'keyvaultkubernetes' -InRemovedState -Location $location -Force

Build-Bicep .\kvtest.bicep
#New-AzResourceGroup -Name 'kvtest' -Location $location
New-AzSubscriptionDeployment -Name 'testdeploy' -TemplateFile 'kvtest.json' -Location $location -TemplateParameterFile $parameterFile