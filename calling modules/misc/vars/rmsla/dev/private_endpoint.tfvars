# Note - Private Endpoints for Recovery Services Vaults are created under the compute module.

# Private endpoint config
private_endpoint_config = {
  ## Storage Account Private Endpoints
  priep-mhra-stmhradevuksrms01-blob = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-dev-uks-network"
    vnet_name                         = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                       = "snet-mhra-dev01-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhradevuksrms01-blob"
    target_resource_name              = "stmhradevuksrms01"
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
      name               = "priep-mhra-stmhradevuksrms01-blob"
      private_ip_address = "10.16.20.132"
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

  priep-mhra-stmhradevuksrms01-file = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-dev-uks-network"
    vnet_name                         = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                       = "snet-mhra-dev01-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhradevuksrms01-file"
    target_resource_name              = "stmhradevuksrms01"
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
      name               = "priep-mhra-stmhradevuksrms01-file"
      private_ip_address = "10.16.20.136"
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

  priep-mhra-stmhradevuksla01-blob = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-dev-uks-network"
    vnet_name                         = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                       = "snet-mhra-dev01-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhradevuksla01-blob"
    target_resource_name              = "stmhradevuksla01"
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
      name               = "priep-mhra-stmhradevuksla01-blob"
      private_ip_address = "10.16.20.134"
      subresource_name   = "blob"
      member_name        = "blob"
    }]
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA"
      application = "LA"
      datatype    = "tbc"
    }
  }

  priep-mhra-stmhradevuksla01-dfs = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-dev-uks-network"
    vnet_name                         = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                       = "snet-mhra-dev01-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhradevuksla01-dfs"
    target_resource_name              = "stmhradevuksla01"
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
      name               = "priep-mhra-stmhradevuksla01-dfs"
      private_ip_address = "10.16.20.154"
      subresource_name   = "dfs"
      member_name        = "dfs"
    }]
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA"
      application = "LA"
      datatype    = "tbc"
    }
  }

  priep-mhra-stmhradevuksla02-blob = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-dev-uks-network"
    vnet_name                         = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                       = "snet-mhra-dev01-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhradevuksla02-blob"
    target_resource_name              = "stmhradevuksla02"
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
      name               = "priep-mhra-stmhradevuksla02-blob"
      private_ip_address = "10.16.20.135"
      subresource_name   = "blob"
      member_name        = "blob"
    }]
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA"
      application = "LA"
      datatype    = "tbc"
    }
  }

  priep-mhra-stmhradevuksla02-dfs = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-dev-uks-network"
    vnet_name                         = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                       = "snet-mhra-dev01-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhradevuksla02-dfs"
    target_resource_name              = "stmhradevuksla02"
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
      name               = "priep-mhra-stmhradevuksla02-dfs"
      private_ip_address = "10.16.20.155"
      subresource_name   = "dfs"
      member_name        = "dfs"
    }]
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA"
      application = "LA"
      datatype    = "tbc"
    }
  }

/*
  priep-mhra-stmhradevuksla02-file = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-dev-uks-network"
    vnet_name                         = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                       = "snet-mhra-dev01-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhradevuksla02-file"
    target_resource_name              = "stmhradevuksla02"
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
      name               = "priep-mhra-stmhradevuksla02-file"
      private_ip_address = "10.16.20.156"
      subresource_name   = "file"
      member_name        = "file"
    }]
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA"
      application = "LA"
      datatype    = "tbc"
    }
  }
  */

  priep-stmhradevuksla03-file = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-dev-uks-network"
    vnet_name                         = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                       = "snet-mhra-dev01-uks-h1s01-data"
    private_service_connection_name   = "priep-stmhradevuksla03-file"
    target_resource_name              = "stmhradevuksla03"
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
      name               = "priep-stmhradevuksla03-file"
      private_ip_address = "10.16.20.137"
      subresource_name   = "file"
      member_name        = "file"
    }]
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA"
      application = "LA"
      datatype    = "tbc"
    }
  }


  ## KeyVault Private Endpoints
  priep-mhra-kvrms01devuks-vault = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-dev-uks-network"
    vnet_name                         = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                       = "snet-mhra-dev01-uks-h1s01-app"
    private_service_connection_name   = "priep-mhra-kvrms01devuks-vault"
    target_resource_name              = "kvrms01devuks"
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
      name               = "priep-mhra-kvrms01devuks-vault"
      private_ip_address = "10.16.16.20"
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

    priep-mhra-kvrms02devuks-vault = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-dev-uks-network"
    vnet_name                         = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                       = "snet-mhra-dev01-uks-h1s01-app"
    private_service_connection_name   = "priep-mhra-kvrms02devuks-vault"
    target_resource_name              = "kvrms02devuks"
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
      name               = "priep-mhra-kvrms02devuks-vault"
      private_ip_address = "10.16.16.39"
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

  priep-mhra-kvla01devuks-vault = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-dev-uks-network"
    vnet_name                         = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                       = "snet-mhra-dev01-uks-h1s01-app"
    private_service_connection_name   = "priep-mhra-kvla01devuks-vault"
    target_resource_name              = "kvla01devuks"
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
      name               = "priep-mhra-kvla01devuks-vault"
      private_ip_address = "10.16.16.21"
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

  priep-mhra-kvappgw01devuks-vault = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-dev-uks-network"
    vnet_name                         = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                       = "snet-mhra-dev01-uks-h1s01-app"
    private_service_connection_name   = "priep-mhra-kvappgw01devuks-vault"
    target_resource_name              = "kvappgw01devuks"
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
      name               = "priep-mhra-kvappgw01devuks-vault"
      private_ip_address = "10.16.16.22"
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

/*
  priep-mhra-adf-la-dev-uks-01-dataFactory = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-dev-uks-network"
    vnet_name                         = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                       = "snet-mhra-dev01-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-adf-la-dev-uks-01-dataFactory"
    target_resource_name              = "adf-la-dev-uks-01"
    subresource_names                 = ["dataFactory"]
    is_manual_connection              = false
    private_connection_resource_alias = ""
    request_message                   = ""
    private_dns_zone_group = {
      private_dns_zone_group_name = "default"
      private_dns_zone_names      = ["privatelink.datafactory.azure.net"]
      private_dns_zone_ids        = []
    }
    target_resource_type = "data_factory"
    ip_configuration = [{
      name               = "priep-mhra-adf-la-dev-uks-01-dataFactory"
      private_ip_address = "10.16.20.15"
      subresource_name   = "dataFactory"
      member_name        = "dataFactory"
    }]
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "Platform"
      application = "tbc"
      datatype    = "tbc"
    }
  }
*/
  priep-stmhradevuksrms02-blob = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-dev-uks-network"
    vnet_name                         = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                       = "snet-mhra-dev01-uks-h1s01-data"
    private_service_connection_name   = "prisc-stmhradevuksrms02-blob"
    target_resource_name              = "stmhradevuksrms02"
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
      name               = "ipconfig-1"
      private_ip_address = "10.16.20.156"
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

  priep-stmhradevuksrms02-dfs = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-dev-uks-network"
    vnet_name                         = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                       = "snet-mhra-dev01-uks-h1s01-data"
    private_service_connection_name   = "prisc-stmhradevuksrms02-dfs"
    target_resource_name              = "stmhradevuksrms02"
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
      name               = "ipconfig-1"
      private_ip_address = "10.16.20.166"
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

/*
priep-stmhradevuksrms03-file = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-dev-uks-network"
    vnet_name                         = "vnet-mhra-dev01-uks-h1s01"
    subnet_name                       = "snet-mhra-dev01-uks-h1s01-data"
    private_service_connection_name   = "priep-stmhradevuksrms02-file"
    target_resource_name              = "stmhradevuksrms03"
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
      name               = "priep-stmhradevuksrms03-file"
      private_ip_address = "10.16.20.157"
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
*/
}
