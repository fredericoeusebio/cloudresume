param resourceGroupName string
param location string

targetScope = 'subscription'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2019-05-01' = {
  name: resourceGroupName
  location: location
}
