# Security module

# Key vault details
key_vaults = {
  kvrms01produks = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-prod-uks-rms"
    enabled_for_disk_encryption     = true
    enabled_for_deployment          = true
    enabled_for_template_deployment = true
    soft_delete_retention_days      = 7
    purge_protection_enabled        = true
    sku_name                        = "standard"
    public_network_access_enabled   = false
    network_acls = {
      enforce_network_rules         = true # set to false if you want the keyvault to allow all traffic.
      bypass                        = "AzureServices"
      whitelist_public_ips_or_cidrs = []
      subnets_config                = {}
    }
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "RMS"
      application = "RMS"
      datatype    = "tbc"
    }
  }

  kvla01produks = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-prod-uks-la"
    enabled_for_disk_encryption     = true
    enabled_for_deployment          = true
    enabled_for_template_deployment = true
    soft_delete_retention_days      = 7
    purge_protection_enabled        = true
    sku_name                        = "standard"
    public_network_access_enabled   = false
    network_acls = {
      enforce_network_rules         = true # # set to false if you want the keyvault to allow all traffic.
      bypass                        = "AzureServices"
      whitelist_public_ips_or_cidrs = []
      subnets_config                = {}
    }
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA"
      application = "LA"
      datatype    = "tbc"
    }
  }

  kvappgw01produks = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-prod-uks-network"
    enabled_for_disk_encryption     = true
    enabled_for_deployment          = true
    enabled_for_template_deployment = true
    soft_delete_retention_days      = 7
    purge_protection_enabled        = true
    sku_name                        = "standard"
    public_network_access_enabled   = true
    network_acls = {
      enforce_network_rules         = true # When deploying in a customer environment, this must be set to "true" otherwise the keyvault firewall will allow all traffic.
      bypass                        = "AzureServices"
      whitelist_public_ips_or_cidrs = ["195.95.131.65/32"]
      subnets_config = {
        vnet-mhra-prod-uks-h1s01 = ["snet-mhra-prod-uks-h1s01-waf"]
      }
    }
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "Platform"
      application = "APP GW Certificates"
      datatype    = "tbc"
    }
  }
}

kv_access_policies = {
  
  kvap-mhra-prod-uks-kvappgw01produks-001 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvappgw01produks"
    application_id = "" # optional attribute to declare the object ID of an application in AAD.
    object_id      = "" # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = "uami" # user assigned managed identity
      name          = "id-mhra-ident-prod-uks-apgw-001"
    }
    key_permissions         = []
    secret_permissions      = ["Get"]
    certificate_permissions = []
    storage_permissions     = []

  }
/*

  kvap-mhra-prod-uks-kvla01produks-001 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvla01produks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "5a416e98-4a50-4413-a9ef-aebf4d7c6287" # "MHRA-LZ-PROD" # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

  kvap-mhra-prod-uks-kvla01produks-002 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvla01produks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "838203fd-87a7-461f-aea5-42ceedff2a0d" # "sg-rg-mhra-prod-uks-la-contributor" # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

  kvap-mhra-prod-uks-kvla01produks-003 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvla01produks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "70e3dee7-a66f-4585-9a90-d8ed57a339f1" # "adf-la-prod-uks-01" (Enterprise App) # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List"]
    secret_permissions      = ["Get", "List"]
    certificate_permissions = []
    storage_permissions     = []
  }

  kvap-mhra-prod-uks-kvrms01produks-001 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvrms01produks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "578a2fb7-647a-4181-ac41-f1ae1c21d519" # "sg-rg-mhra-prod-uks-rms-contributor"  # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

  kvap-mhra-prod-uks-kvrms01produks-002 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvrms01produks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "5a416e98-4a50-4413-a9ef-aebf4d7c6287" # "MHRA-LZ-PROD" (enterprise App)  # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

  kvap-mhra-prod-uks-kvrms01produks-004 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvrms01produks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "9fd94cbe-e3bd-4b93-bd5f-2cba0f78301b" # "azml-rms-prod-uks-01" = (Enterprise App) # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }
  */
}
