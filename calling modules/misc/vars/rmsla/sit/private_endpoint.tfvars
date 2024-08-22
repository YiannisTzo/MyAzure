# Note - Private Endpoints for Recovery Services Vaults are created under the compute module.

# Private endpoint config
private_endpoint_config = {
  ## Storage Account Private Endpoints

  priep-mhra-stmhrasituksrms01-blob = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-sit-uks-network"
    vnet_name                         = "vnet-mhra-sit-uks-h1s01"
    subnet_name                       = "snet-mhra-sit-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhrasituksrms01-blob"
    target_resource_name              = "stmhrasituksrms01"
    subresource_names                 = ["blob"]
    is_manual_connection              = false
    private_connection_resource_alias = ""
    request_message                   = ""
    private_dns_zone_group = {
      private_dns_zone_group_name = "default"
      private_dns_zone_names      = ["privatelink.blob.core.windows.net"]
      private_dns_zone_ids        = []
    }
    target_resource_type = "storage_account"
    ip_configuration = [{
      name               = "priep-mhra-stmhrasituksrms01-blob"
      private_ip_address = "10.24.20.132"
      subresource_name   = "blob"
      member_name        = "blob"
    }]
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "RMS"
      application = "RMS"
      datatype    = "tbc"
    }
  }

  priep-mhra-stmhrasituksrms01-file = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-sit-uks-network"
    vnet_name                         = "vnet-mhra-sit-uks-h1s01"
    subnet_name                       = "snet-mhra-sit-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhrasituksrms01-file"
    target_resource_name              = "stmhrasituksrms01"
    subresource_names                 = ["file"]
    is_manual_connection              = false
    private_connection_resource_alias = ""
    request_message                   = ""
    private_dns_zone_group = {
      private_dns_zone_group_name = "default"
      private_dns_zone_names      = ["privatelink.file.core.windows.net"]
      private_dns_zone_ids        = []
    }
    target_resource_type = "storage_account"
    ip_configuration = [{
      name               = "priep-mhra-stmhrasituksrms01-file"
      private_ip_address = "10.24.20.136"
      subresource_name   = "file"
      member_name        = "file"
    }]
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "RMS"
      application = "RMS"
      datatype    = "tbc"
    }
  }

    priep-mhra-stmhrasituksrms03-file = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-sit-uks-network"
    vnet_name                         = "vnet-mhra-sit-uks-h1s01"
    subnet_name                       = "snet-mhra-sit-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhrasituksrms03-file"
    target_resource_name              = "stmhrasituksrms03"
    subresource_names                 = ["file"]
    is_manual_connection              = false
    private_connection_resource_alias = ""
    request_message                   = ""
    private_dns_zone_group = {
      private_dns_zone_group_name = "default"
      private_dns_zone_names      = ["privatelink.file.core.windows.net"]
      private_dns_zone_ids        = []
    }
    target_resource_type = "storage_account"
    ip_configuration = [{
      name               = "priep-mhra-stmhrasituksrms03-file"
      private_ip_address = "10.24.20.157"
      subresource_name   = "file"
      member_name        = "file"
    }]
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "RMS"
      application = "RMS"
      datatype    = "tbc"
    }
  }

  ## KeyVault Private Endpoints
  priep-mhra-kvrms01situks-vault = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-sit-uks-network"
    vnet_name                         = "vnet-mhra-sit-uks-h1s01"
    subnet_name                       = "snet-mhra-sit-uks-h1s01-app"
    private_service_connection_name   = "priep-mhra-kvrms01situks-vault"
    target_resource_name              = "kvrms01situks"
    subresource_names                 = ["vault"]
    is_manual_connection              = false
    private_connection_resource_alias = ""
    request_message                   = ""
    private_dns_zone_group = {
      private_dns_zone_group_name = "default"
      private_dns_zone_names      = ["privatelink.vaultcore.azure.net"]
      private_dns_zone_ids        = []
    }
    target_resource_type = "key_vault"
    ip_configuration = [{
      name               = "priep-mhra-kvrms01situks-vault"
      private_ip_address = "10.24.16.15"
      subresource_name   = "vault"
      member_name        = "default"
    }]
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "RMS"
      application = "RMS"
      datatype    = "tbc"
    }
  }

  priep-mhra-kvla01situks-vault = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-sit-uks-network"
    vnet_name                         = "vnet-mhra-sit-uks-h1s01"
    subnet_name                       = "snet-mhra-sit-uks-h1s01-app"
    private_service_connection_name   = "priep-mhra-kvla01situks-vault"
    target_resource_name              = "kvla01situks"
    subresource_names                 = ["vault"]
    is_manual_connection              = false
    private_connection_resource_alias = ""
    request_message                   = ""
    private_dns_zone_group = {
      private_dns_zone_group_name = "default"
      private_dns_zone_names      = ["privatelink.vaultcore.azure.net"]
      private_dns_zone_ids        = []
    }
    target_resource_type = "key_vault"
    ip_configuration = [{
      name               = "priep-mhra-kvla01situks-vault"
      private_ip_address = "10.24.16.16"
      subresource_name   = "vault"
      member_name        = "default"
    }]
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA"
      application = "LA"
      datatype    = "tbc"
    }
  }

  priep-mhra-kvappgw01situks-vault = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-sit-uks-network"
    vnet_name                         = "vnet-mhra-sit-uks-h1s01"
    subnet_name                       = "snet-mhra-sit-uks-h1s01-app"
    private_service_connection_name   = "priep-mhra-kvappgw01situks-vault"
    target_resource_name              = "kvappgw01situks"
    subresource_names                 = ["vault"]
    is_manual_connection              = false
    private_connection_resource_alias = ""
    request_message                   = ""
    private_dns_zone_group = {
      private_dns_zone_group_name = "default"
      private_dns_zone_names      = ["privatelink.vaultcore.azure.net"]
      private_dns_zone_ids        = []
    }
    target_resource_type = "key_vault"
    ip_configuration = [{
      name               = "priep-mhra-kvappgw01situks-vault"
      private_ip_address = "10.24.16.17"
      subresource_name   = "vault"
      member_name        = "default"
    }]
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "Platform"
      application = "APP GW Certificates"
      datatype    = "tbc"
    }
  }

  priep-mhra-stmhrasituksrms02-blob = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-sit-uks-network"
    vnet_name                         = "vnet-mhra-sit-uks-h1s01"
    subnet_name                       = "snet-mhra-sit-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhrasituksrms02-blob"
    target_resource_name              = "stmhrasituksrms02"
    subresource_names                 = ["blob"]
    is_manual_connection              = false
    private_connection_resource_alias = ""
    request_message                   = ""
    private_dns_zone_group = {
      private_dns_zone_group_name = "default"
      private_dns_zone_names      = ["privatelink.blob.core.windows.net"]
      private_dns_zone_ids        = []
    }
    target_resource_type = "storage_account"
    ip_configuration = [{
      name               = "priep-mhra-stmhrasituksrms02-blob"
      private_ip_address = "10.24.20.137"
      subresource_name   = "blob"
      member_name        = "blob"
    }]
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "RMS"
      application = "RMS"
      datatype    = "tbc"
    }
  }

  priep-mhra-stmhrasituksrms02-dfs = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-sit-uks-network"
    vnet_name                         = "vnet-mhra-sit-uks-h1s01"
    subnet_name                       = "snet-mhra-sit-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhrasituksrms02-dfs"
    target_resource_name              = "stmhrasituksrms02"
    subresource_names                 = ["dfs"]
    is_manual_connection              = false
    private_connection_resource_alias = ""
    request_message                   = ""
    private_dns_zone_group = {
      private_dns_zone_group_name = "default"
      private_dns_zone_names      = ["privatelink.dfs.core.windows.net"]
      private_dns_zone_ids        = []
    }
    target_resource_type = "storage_account"
    ip_configuration = [{
      name               = "priep-mhra-stmhrasituksrms02-dfs"
      private_ip_address = "10.24.20.166"
      subresource_name   = "dfs"
      member_name        = "dfs"
    }]
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "RMS"
      application = "RMS"
      datatype    = "tbc"
    }
  }

}