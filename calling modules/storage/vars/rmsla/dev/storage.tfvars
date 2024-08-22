# Storage module

# Storage account
# name can only consist of lowercase letters and numbers,
# and must be between 3 and 24 characters long
storage_account_config = {
  stmhradevuksrms01 = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-dev-uks-rms"
    account_tier                    = "Standard"
    account_replication_type        = "LRS"
    access_tier                     = "Hot"
    account_kind                    = "StorageV2"
    public_network_access_enabled   = true
    allow_nested_items_to_be_public = false # set this to the same value as "public_network_access_enabled"
    network_rules = {
      enforce_network_rules         = true # set to false if you want the keyvault to allow all traffic.
      whitelist_public_ips_or_cidrs = ["20.90.134.31", "103.156.18.61", "122.182.175.206", "188.29.111.32"]
      bypass_traffic                = ["AzureServices"]
      subnets_config = {
      }

      private_link_access_config = [
        # TODO Following config is placeholder and its use is not confirmed yet
        #        {
        #          endpoint_resource_id = "some id"
        #          endpoint_tenant_id   = "some id"
        #        }
      ]
    }
    tags = {
      costcentre        = "tbc"
      projectcode       = "tbc"
      owner             = "RMS"
      application       = "RMS"
      datatype          = "tbc"
      ms-resource-usage = "azure-cloud-shell"
    }

    hierarchical_namespace_enabled = false
  }

  stmhradevuksrms02 = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-dev-uks-rms"
    account_tier                    = "Standard"
    account_replication_type        = "LRS"
    access_tier                     = "Hot"
    account_kind                    = "StorageV2"
    public_network_access_enabled   = true
    allow_nested_items_to_be_public = false # set this to the same value as "public_network_access_enabled"
    network_rules = {
      enforce_network_rules         = true # set to false if you want the keyvault to allow all traffic.
      whitelist_public_ips_or_cidrs = ["103.156.18.58", "103.156.18.61", "103.156.18.62", "106.194.152.103", "152.58.208.195", "152.58.208.94", "152.58.209.186", "152.58.209.61", "152.58.210.241", "18.135.112.100", "18.135.112.128", "18.135.112.181", "20.26.54.85", "35.177.153.88", "51.104.28.67", "52.56.57.70", "52.56.95.43", "54.170.239.72", "54.228.31.150", "54.229.32.187", "54.229.33.30", "54.229.33.31", "54.247.146.71"]
      bypass_traffic                = ["AzureServices"]
      subnets_config = {
      }

      private_link_access_config = [
        # TODO Following config is placeholder and its use is not confirmed yet
        #        {
        #          endpoint_resource_id = "some id"
        #          endpoint_tenant_id   = "some id"
        #        }
      ]
    }
    tags = {
      costcentre        = "tbc"
      projectcode       = "tbc"
      owner             = "RMS"
      application       = "RMS"
      datatype          = "tbc"
      ms-resource-usage = "azure-cloud-shell"
    }

    hierarchical_namespace_enabled = true
  }

  stmhradevuksrms03 = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-dev-uks-rms"
    account_tier                    = "Premium"
    account_replication_type        = "ZRS"
    access_tier                     = "Hot"
    account_kind                    = "FileStorage"
    public_network_access_enabled   = true
    allow_nested_items_to_be_public = false # set this to the same value as "public_network_access_enabled"
    network_rules = {
      enforce_network_rules         = true # set to false if you want the keyvault to allow all traffic.
      whitelist_public_ips_or_cidrs = []
      bypass_traffic                = ["AzureServices"]
      subnets_config = {
      }

      private_link_access_config = [
        # TODO Following config is placeholder and its use is not confirmed yet
        #        {
        #          endpoint_resource_id = "some id"
        #          endpoint_tenant_id   = "some id"
        #        }
      ]
    }
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "RMS"
      application = "RMS"
      datatype    = "tbc"
    }

    hierarchical_namespace_enabled = false

    azure_files_authentication = {
    directory_type = "AD"
    active_directory = {
      domain_name         = "ad.mhra.gov.uk"
      domain_guid         = "ff53048a-a028-4509-8626-122c41adc215"
      domain_sid          = "S-1-5-21-955253713-2270966224-1425722354"
      storage_sid         = "S-1-5-21-955253713-2270966224-1425722354-40207"
      forest_name         = "ad.mhra.gov.uk"
      netbios_domain_name = "ad.mhra.gov.uk"
    }
  }
  }

  stmhradevuksla01 = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-dev-uks-la"
    account_tier                    = "Standard"
    account_replication_type        = "LRS"
    access_tier                     = "Hot"
    account_kind                    = "StorageV2"
    public_network_access_enabled   = false
    allow_nested_items_to_be_public = false # set this to the same value as "public_network_access_enabled"
    network_rules = {
      enforce_network_rules         = true # set to false if you want the keyvault to allow all traffic.
      whitelist_public_ips_or_cidrs = ["37.130.234.1"]
      bypass_traffic                = ["AzureServices", "Logging"]
      subnets_config = {
      }

      private_link_access_config = [
        # TODO Following config is placeholder and its use is not confirmed yet
        #        {
        #          endpoint_resource_id = "some id"
        #          endpoint_tenant_id   = "some id"
        #        }
      ]
    }
    tags = {
      costcentre        = "tbc"
      projectcode       = "tbc"
      owner             = "LA"
      application       = "LA"
      datatype          = "tbc"
      ms-resource-usage = "azure-cloud-shell"
    }

    hierarchical_namespace_enabled = true
  }

  stmhradevuksla02 = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-dev-uks-la"
    account_tier                    = "Standard"
    account_replication_type        = "LRS"
    access_tier                     = "Hot"
    account_kind                    = "StorageV2"
    public_network_access_enabled   = true
    allow_nested_items_to_be_public = false # set this to the same value as "public_network_access_enabled"
    network_rules = {
      enforce_network_rules         = true # set to false if you want the keyvault to allow all traffic.
      whitelist_public_ips_or_cidrs = ["37.130.234.1"]
      bypass_traffic                = ["None"]
      subnets_config = {
      }

      private_link_access_config = [
        # TODO Following config is placeholder and its use is not confirmed yet
        #        {
        #          endpoint_resource_id = "some id"
        #          endpoint_tenant_id   = "some id"
        #        }
      ]
    }
    tags = {
      costcentre        = "tbc"
      projectcode       = "tbc"
      owner             = "LA"
      application       = "LA"
      datatype          = "tbc"
      ms-resource-usage = "azure-cloud-shell"
    }

    hierarchical_namespace_enabled = true
  }

  stmhradevuksla03 = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-dev-uks-la"
    account_tier                    = "Premium"
    account_replication_type        = "ZRS"
    access_tier                     = "Hot"
    account_kind                    = "FileStorage"
    public_network_access_enabled   = false
    allow_nested_items_to_be_public = false # set this to the same value as "public_network_access_enabled"
    network_rules = {
      enforce_network_rules         = true # set to false if you want the keyvault to allow all traffic.
      whitelist_public_ips_or_cidrs = []
      bypass_traffic                = ["None"]
      subnets_config = {
      }

      private_link_access_config = [
        # TODO Following config is placeholder and its use is not confirmed yet
        #        {
        #          endpoint_resource_id = "some id"
        #          endpoint_tenant_id   = "some id"
        #        }
      ]
    }
    tags = {
      costcentre        = "tbc"
      projectcode       = "tbc"
      owner             = "LA"
      application       = "LA"
      datatype          = "tbc"
      ms-resource-usage = "azure-cloud-shell"
    }

    hierarchical_namespace_enabled = false

    azure_files_authentication = {
     directory_type = "AD"
     active_directory = {
      domain_name         = "ad.mhra.gov.uk"
      domain_guid         = "ff53048a-a028-4509-8626-122c41adc215"
      domain_sid          = "S-1-5-21-955253713-2270966224-1425722354"
      storage_sid         = "S-1-5-21-955253713-2270966224-1425722354-40206"
      forest_name         = "ad.mhra.gov.uk"
      netbios_domain_name = "ad.mhra.gov.uk"
    }
  }
  }
}
