# Storage module

# Storage account
# name can only consist of lowercase letters and numbers,
# and must be between 3 and 24 characters long
storage_account_config = {
  stmhraperfuksrms01 = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-perf-uks-rms"
    account_tier                    = "Standard"
    account_replication_type        = "LRS"
    access_tier                     = "Hot"
    account_kind                    = "StorageV2"
    public_network_access_enabled   = false
    allow_nested_items_to_be_public = false # set this to the same value as "public_network_access_enabled"
    network_rules = {
      enforce_network_rules         = true # set to false if you want the storage account to allow all traffic.
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
      "ms-resource-usage" = "azure-cloud-shell"
    }

    hierarchical_namespace_enabled = false
  }

  stmhraperfuksrms02 = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-perf-uks-rms"
    account_tier                    = "Standard"
    account_replication_type        = "LRS"
    access_tier                     = "Hot"
    account_kind                    = "StorageV2"
    public_network_access_enabled   = false
    allow_nested_items_to_be_public = false # set this to the same value as "public_network_access_enabled"
    network_rules = {
      enforce_network_rules         = true # set to false if you want the storage account to allow all traffic.
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

    hierarchical_namespace_enabled = true
  }

  stmhraperfuksrms03 = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-perf-uks-rms"
    account_tier                    = "Premium"
    account_replication_type        = "ZRS"
    access_tier                     = "Hot"
    account_kind                    = "FileStorage"
    public_network_access_enabled   = false
    allow_nested_items_to_be_public = false # set this to the same value as "public_network_access_enabled"
    network_rules = {
      enforce_network_rules         = true # set to false if you want the storage account to allow all traffic.
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
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "RMS"
      application = "RMS"
      datatype    = "tbc"
    }

    hierarchical_namespace_enabled = false
  }
}