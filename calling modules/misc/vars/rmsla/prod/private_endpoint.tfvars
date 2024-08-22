# Note - Private Endpoints for Recovery Services Vaults are created under the compute module.

# Private endpoint config
private_endpoint_config = {
  ## Storage Account Private Endpoints
  priep-mhra-stmhraproduksrms01-blob = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-prod-uks-network"
    vnet_name                         = "vnet-mhra-prod-uks-h1s01"
    subnet_name                       = "snet-mhra-prod-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhraproduksrms01-blob"
    target_resource_name              = "stmhraproduksrms01"
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
      name               = "priep-mhra-stmhraproduksrms01-blob"
      private_ip_address = "10.18.20.132"
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

  priep-mhra-stmhraproduksrms01-file = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-prod-uks-network"
    vnet_name                         = "vnet-mhra-prod-uks-h1s01"
    subnet_name                       = "snet-mhra-prod-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhraproduksrms01-file"
    target_resource_name              = "stmhraproduksrms01"
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
      name               = "priep-mhra-stmhraproduksrms01-file"
      private_ip_address = "10.18.20.136"
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

  priep-mhra-stmhraproduksla01-blob = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-prod-uks-network"
    vnet_name                         = "vnet-mhra-prod-uks-h1s01"
    subnet_name                       = "snet-mhra-prod-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhraproduksla01-blob"
    target_resource_name              = "stmhraproduksla01"
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
      name               = "priep-mhra-stmhraproduksla01-blob"
      private_ip_address = "10.18.20.134"
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

  priep-mhra-stmhraproduksla02-blob = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-prod-uks-network"
    vnet_name                         = "vnet-mhra-prod-uks-h1s01"
    subnet_name                       = "snet-mhra-prod-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhraproduksla02-blob"
    target_resource_name              = "stmhraproduksla02"
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
      name               = "priep-mhra-stmhraproduksla02-blob"
      private_ip_address = "10.18.20.135"
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

  priep-mhra-stmhraproduksla01-dfs = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-prod-uks-network"
    vnet_name                         = "vnet-mhra-prod-uks-h1s01"
    subnet_name                       = "snet-mhra-prod-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhraproduksla01-dfs"
    target_resource_name              = "stmhraproduksla01"
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
      name               = "priep-mhra-stmhraproduksla01-dfs"
      private_ip_address = "10.18.20.154"
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

  priep-mhra-stmhraproduksla02-dfs = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-prod-uks-network"
    vnet_name                         = "vnet-mhra-prod-uks-h1s01"
    subnet_name                       = "snet-mhra-prod-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhraproduksla02-dfs"
    target_resource_name              = "stmhraproduksla02"
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
      name               = "priep-mhra-stmhraproduksla02-dfs"
      private_ip_address = "10.18.20.155"
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

  priep-mhra-stmhraproduksla02-file = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-prod-uks-network"
    vnet_name                         = "vnet-mhra-prod-uks-h1s01"
    subnet_name                       = "snet-mhra-prod-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhraproduksla02-file"
    target_resource_name              = "stmhraproduksla02"
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
      name               = "priep-mhra-stmhraproduksla02-file"
      private_ip_address = "10.18.20.156"
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
  priep-mhra-kvrms01produks-vault = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-prod-uks-network"
    vnet_name                         = "vnet-mhra-prod-uks-h1s01"
    subnet_name                       = "snet-mhra-prod-uks-h1s01-app"
    private_service_connection_name   = "priep-mhra-kvrms01produks-vault"
    target_resource_name              = "kvrms01produks"
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
      name               = "priep-mhra-kvrms01produks-vault"
      private_ip_address = "10.18.16.15"
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

  priep-mhra-kvla01produks-vault = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-prod-uks-network"
    vnet_name                         = "vnet-mhra-prod-uks-h1s01"
    subnet_name                       = "snet-mhra-prod-uks-h1s01-app"
    private_service_connection_name   = "priep-mhra-kvla01produks-vault"
    target_resource_name              = "kvla01produks"
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
      name               = "priep-mhra-kvla01produks-vault"
      private_ip_address = "10.18.16.16"
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

  priep-mhra-kvappgw01produks-vault = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-prod-uks-network"
    vnet_name                         = "vnet-mhra-prod-uks-h1s01"
    subnet_name                       = "snet-mhra-prod-uks-h1s01-app"
    private_service_connection_name   = "priep-mhra-kvappgw01produks-vault"
    target_resource_name              = "kvappgw01produks"
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
      name               = "priep-mhra-kvappgw01produks-vault"
      private_ip_address = "10.18.16.17"
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

  priep-mhra-stmhraproduksrms02-blob = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-prod-uks-network"
    vnet_name                         = "vnet-mhra-prod-uks-h1s01"
    subnet_name                       = "snet-mhra-prod-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhraproduksrms02-blob"
    target_resource_name              = "stmhraproduksrms02"
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
      name               = "priep-mhra-stmhraproduksrms02-blob"
      private_ip_address = "10.18.20.137"
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

  priep-mhra-stmhraproduksrms02-dfs = {
    provider_alias                    = "spoke1-sub"
    is_applicable                     = true
    resource_group_name               = "rg-mhra-prod-uks-network"
    vnet_name                         = "vnet-mhra-prod-uks-h1s01"
    subnet_name                       = "snet-mhra-prod-uks-h1s01-data"
    private_service_connection_name   = "priep-mhra-stmhraproduksrms02-dfs"
    target_resource_name              = "stmhraproduksrms02"
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
      name               = "priep-mhra-stmhraproduksrms02-dfs"
      private_ip_address = "10.18.20.166"
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
