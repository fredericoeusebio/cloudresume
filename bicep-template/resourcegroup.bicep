// Step 1 -  This template deploys a resource group to the subscription
// Setting the targetScope to subscription will deploy the resource group to the subscription
targetScope = 'subscription'

// Step 2 -  Define the parameters that will be used in the template
param resourceGroupName string = resourceGroup().name
param location string = resourceGroup().location

// Step 3 -  Define the resources in the template
resource resourceGroup'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupname
  location: location
}
