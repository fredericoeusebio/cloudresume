@description('Specifies the location for resources.')
param location string = 'uksouth'

@secure()
param domains_feusebio_co_uk_email string

@secure()
param domains_feusebio_co_uk_nameFirst string

@secure()
param domains_feusebio_co_uk_nameLast string

@secure()
param domains_feusebio_co_uk_phone string

@secure()
param domains_feusebio_co_uk_email_1 string

@secure()
param domains_feusebio_co_uk_nameFirst_1 string

@secure()
param domains_feusebio_co_uk_nameLast_1 string

@secure()
param domains_feusebio_co_uk_phone_1 string

@secure()
param domains_feusebio_co_uk_email_2 string

@secure()
param domains_feusebio_co_uk_nameFirst_2 string

@secure()
param domains_feusebio_co_uk_nameLast_2 string

@secure()
param domains_feusebio_co_uk_phone_2 string

@secure()
param domains_feusebio_co_uk_email_3 string

@secure()
param domains_feusebio_co_uk_nameFirst_3 string

@secure()
param domains_feusebio_co_uk_nameLast_3 string

@secure()
param domains_feusebio_co_uk_phone_3 string
param profiles_productionwebsite_name string = 'productionwebsite'
param dnszones_feusebio_co_uk_name string = 'feusebio.co.uk'
param domains_feusebio_co_uk_name string = 'feusebio.co.uk'
param storageAccounts_productionwebsite_name string = 'productionwebsite'

resource profiles_productionwebsite_name_resource 'Microsoft.Cdn/profiles@2022-11-01-preview' = {
  name: profiles_productionwebsite_name
  location: 'Global'
  sku: {
    name: 'Standard_Microsoft'
  }
  kind: 'cdn'
  properties: {
    extendedProperties: {}
  }
}

resource dnszones_feusebio_co_uk_name_resource 'Microsoft.Network/dnszones@2018-05-01' = {
  name: dnszones_feusebio_co_uk_name
  location: 'global'
  properties: {
    zoneType: 'Public'
  }
}

resource storageAccounts_productionwebsite_name_resource 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccounts_productionwebsite_name
  location: location
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    dnsEndpointType: 'Standard'
    defaultToOAuthAuthentication: false
    publicNetworkAccess: 'Enabled'
    allowCrossTenantReplication: true
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: true
    allowSharedKeyAccess: true
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      requireInfrastructureEncryption: false
      services: {
        file: {
          keyType: 'Account'
          enabled: true
        }
        blob: {
          keyType: 'Account'
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource profiles_productionwebsite_name_feusebio 'Microsoft.Cdn/profiles/endpoints@2022-11-01-preview' = {
  parent: profiles_productionwebsite_name_resource
  name: 'feusebio'
  location: 'Global'
  properties: {
    originHostHeader: 'productionwebsite.z33.web.core.windows.net'
    contentTypesToCompress: [
      'application/eot'
      'application/font'
      'application/font-sfnt'
      'application/javascript'
      'application/json'
      'application/opentype'
      'application/otf'
      'application/pkcs7-mime'
      'application/truetype'
      'application/ttf'
      'application/vnd.ms-fontobject'
      'application/xhtml+xml'
      'application/xml'
      'application/xml+rss'
      'application/x-font-opentype'
      'application/x-font-truetype'
      'application/x-font-ttf'
      'application/x-httpd-cgi'
      'application/x-javascript'
      'application/x-mpegurl'
      'application/x-opentype'
      'application/x-otf'
      'application/x-perl'
      'application/x-ttf'
      'font/eot'
      'font/ttf'
      'font/otf'
      'font/opentype'
      'image/svg+xml'
      'text/css'
      'text/csv'
      'text/html'
      'text/javascript'
      'text/js'
      'text/plain'
      'text/richtext'
      'text/tab-separated-values'
      'text/xml'
      'text/x-script'
      'text/x-component'
      'text/x-java-source'
    ]
    isCompressionEnabled: true
    isHttpAllowed: true
    isHttpsAllowed: true
    queryStringCachingBehavior: 'IgnoreQueryString'
    origins: [
      {
        name: 'productionwebsite-z33-web-core-windows-net'
        properties: {
          hostName: 'productionwebsite.z33.web.core.windows.net'
          httpPort: 80
          httpsPort: 443
          originHostHeader: 'productionwebsite.z33.web.core.windows.net'
          priority: 1
          weight: 1000
          enabled: true
        }
      }
    ]
    originGroups: []
    geoFilters: []
  }
}

resource domains_feusebio_co_uk_name_resource 'Microsoft.DomainRegistration/domains@2022-09-01' = {
  name: domains_feusebio_co_uk_name
  location: 'global'
  properties: {
    privacy: false
    autoRenew: false
    dnsType: 'AzureDns'
    dnsZoneId: dnszones_feusebio_co_uk_name_resource.id
    consent: {}
    contactAdmin: {
      email: domains_feusebio_co_uk_email
      nameFirst: domains_feusebio_co_uk_nameFirst
      nameLast: domains_feusebio_co_uk_nameLast
      phone: domains_feusebio_co_uk_phone
    }
    contactBilling: {
      email: domains_feusebio_co_uk_email_1
      nameFirst: domains_feusebio_co_uk_nameFirst_1
      nameLast: domains_feusebio_co_uk_nameLast_1
      phone: domains_feusebio_co_uk_phone_1
    }
    contactRegistrant: {
      email: domains_feusebio_co_uk_email_2
      nameFirst: domains_feusebio_co_uk_nameFirst_2
      nameLast: domains_feusebio_co_uk_nameLast_2
      phone: domains_feusebio_co_uk_phone_2
    }
    contactTech: {
      email: domains_feusebio_co_uk_email_3
      nameFirst: domains_feusebio_co_uk_nameFirst_3
      nameLast: domains_feusebio_co_uk_nameLast_3
      phone: domains_feusebio_co_uk_phone_3
    }
  }
}

resource dnszones_feusebio_co_uk_name_www 'Microsoft.Network/dnszones/CNAME@2018-05-01' = {
  parent: dnszones_feusebio_co_uk_name_resource
  name: 'www'
  properties: {
    TTL: 3600
    CNAMERecord: {
      cname: 'feusebio.azureedge.net'
    }
    targetResource: {}
  }
}

resource Microsoft_Network_dnszones_NS_dnszones_feusebio_co_uk_name 'Microsoft.Network/dnszones/NS@2018-05-01' = {
  parent: dnszones_feusebio_co_uk_name_resource
  name: '@'
  properties: {
    TTL: 172800
    NSRecords: [
      {
        nsdname: 'ns1-01.azure-dns.com.'
      }
      {
        nsdname: 'ns2-01.azure-dns.net.'
      }
      {
        nsdname: 'ns3-01.azure-dns.org.'
      }
      {
        nsdname: 'ns4-01.azure-dns.info.'
      }
    ]
    targetResource: {}
  }
}

resource Microsoft_Network_dnszones_SOA_dnszones_feusebio_co_uk_name 'Microsoft.Network/dnszones/SOA@2018-05-01' = {
  parent: dnszones_feusebio_co_uk_name_resource
  name: '@'
  properties: {
    TTL: 3600
    SOARecord: {
      email: 'azuredns-hostmaster.microsoft.com'
      expireTime: 2419200
      host: 'ns1-01.azure-dns.com.'
      minimumTTL: 300
      refreshTime: 3600
      retryTime: 300
      serialNumber: 1
    }
    targetResource: {}
  }
}

resource storageAccounts_productionwebsite_name_default 'Microsoft.Storage/storageAccounts/blobServices@2022-09-01' = {
  parent: storageAccounts_productionwebsite_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    changeFeed: {
      enabled: false
    }
    restorePolicy: {
      enabled: false
    }
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
    cors: {
      corsRules: []
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      enabled: true
      days: 7
    }
    isVersioningEnabled: false
  }
}

resource Microsoft_Storage_storageAccounts_fileServices_storageAccounts_productionwebsite_name_default 'Microsoft.Storage/storageAccounts/fileServices@2022-09-01' = {
  parent: storageAccounts_productionwebsite_name_resource
  name: 'default'
  sku: {
    name: 'Standard_LRS'
    tier: 'Standard'
  }
  properties: {
    protocolSettings: {
      smb: {}
    }
    cors: {
      corsRules: []
    }
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 7
    }
  }
}

resource Microsoft_Storage_storageAccounts_queueServices_storageAccounts_productionwebsite_name_default 'Microsoft.Storage/storageAccounts/queueServices@2022-09-01' = {
  parent: storageAccounts_productionwebsite_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource Microsoft_Storage_storageAccounts_tableServices_storageAccounts_productionwebsite_name_default 'Microsoft.Storage/storageAccounts/tableServices@2022-09-01' = {
  parent: storageAccounts_productionwebsite_name_resource
  name: 'default'
  properties: {
    cors: {
      corsRules: []
    }
  }
}

resource profiles_productionwebsite_name_feusebio_www_feusebio_co_uk 'Microsoft.Cdn/profiles/endpoints/customdomains@2022-11-01-preview' = {
  parent: profiles_productionwebsite_name_feusebio
  name: 'www-feusebio-co-uk'
  properties: {
    hostName: 'www.feusebio.co.uk'
  }
}

resource profiles_productionwebsite_name_feusebio_profiles_productionwebsite_name_z33_web_core_windows_net 'Microsoft.Cdn/profiles/endpoints/origins@2022-11-01-preview' = {
  parent: profiles_productionwebsite_name_feusebio
  name: '${profiles_productionwebsite_name}-z33-web-core-windows-net'
  properties: {
    hostName: 'productionwebsite.z33.web.core.windows.net'
    httpPort: 80
    httpsPort: 443
    originHostHeader: 'productionwebsite.z33.web.core.windows.net'
    priority: 1
    weight: 1000
    enabled: true
  }
}

resource storageAccounts_productionwebsite_name_default_web 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01' = {
  parent: storageAccounts_productionwebsite_name_default
  name: '$web'
  properties: {
    immutableStorageWithVersioning: {
      enabled: false
    }
    defaultEncryptionScope: '$account-encryption-key'
    denyEncryptionScopeOverride: false
    publicAccess: 'None'
  }
}
