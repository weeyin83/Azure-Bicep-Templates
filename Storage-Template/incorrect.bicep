@description('Storage Account type')
@allowed([
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GRS'
  'Standard_GZRS'
  'Standard_LRS'
  'Standard_RAGRS'
  'Standard_RAGZRS'
  'Standard_ZRS'
])

@description('Location for all resources.')
param location string = resourceGroup().location

@description('The name of the Storage Account')
param storageAccountName string = 'store${uniqueString(resourceGroup().id)}'

@description('The name of the Owner of this resource for the Azure Tag declaration')
param ownerTag string = 'Sarah'

@description('The purpose of this resource for the Azure Tag declaration')
param purposeTag string = 'Demo'

resource storage 'Microsoft.Storage/storageAccounts@2022-05-01' = {
  name: storageAccountName
  location: location
  tags: {
    Owner: ownerTag
    Purpose: purposeTag
  }
  sku: {
    name: storageAccountType
  }
  kind: 'StorageV2'
  properties: {}
}

output storageAccountName string = storageAccountName
output storageAccountId string = storage.id
