# Security module

# Key vault details
key_vaults = {
  kvrms01perfuks = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-perf-uks-rms"
    enabled_for_disk_encryption     = true
    enabled_for_deployment          = true
    enabled_for_template_deployment = true
    soft_delete_retention_days      = 7
    purge_protection_enabled        = false
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

  kvla01perfuks = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-perf-uks-la"
    enabled_for_disk_encryption     = true
    enabled_for_deployment          = true
    enabled_for_template_deployment = true
    soft_delete_retention_days      = 7
    purge_protection_enabled        = false
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

  kvappgw01perfuks = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-perf-uks-network"
    enabled_for_disk_encryption     = true
    enabled_for_deployment          = true
    enabled_for_template_deployment = true
    soft_delete_retention_days      = 7
    purge_protection_enabled        = false
    sku_name                        = "standard"
    public_network_access_enabled   = true
    network_acls = {
      enforce_network_rules         = true # When deploying in a customer environment, this must be set to "true" otherwise the keyvault firewall will allow all traffic.
      bypass                        = "AzureServices"
      whitelist_public_ips_or_cidrs = ["195.95.131.65/32"]
      subnets_config = {
        vnet-mhra-perf-uks-h1s01 = ["snet-mhra-perf-uks-h1s01-waf"]
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
  kvap-mhra-perf-uks-kvappgw01perfuks-001 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvappgw01perfuks"
    application_id = "" # optional attribute to declare the object ID of an application in AAD.
    object_id      = "" # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = "uami" # user assigned managed identity
      name          = "id-mhra-ident-perf-uks-apgw-001"
    }
    key_permissions         = []
    secret_permissions      = ["Get"]
    certificate_permissions = []
    storage_permissions     = []
  }

  kvap-mhra-perf-uks-kvla01perfuks-001 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvla01perfuks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "93cfa6ed-b33d-4453-9b9b-c47bfa90000f" # (MHRA-LZ-PERF - Enterprise App) # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

  kvap-mhra-perf-uks-kvla01perfuks-002 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvla01perfuks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "e2ba5b57-83b9-47b4-b244-5d07f545488d" # (sg-rg-mhra-perf-uks-la-contributor) # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

  kvap-mhra-perf-uks-kvla01perfuks-003 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvla01perfuks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "98274929-ac6b-4681-aaee-f1b7db86afc7" #(adf-la-perf-uks-01) # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

  kvap-mhra-perf-uks-kvrms01perfuks-001 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvrms01perfuks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "bc29b144-6da1-4b85-801a-a31b70a2028c" # (MHRA-LZ-PERF - Enterprise App) # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

  kvap-mhra-perf-uks-kvrms01perfuks-002 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvrms01perfuks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "93cfa6ed-b33d-4453-9b9b-c47bfa90000f" # (MHRA-LZ-PERF - Enterprise App) # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }
/*
  kvap-mhra-perf-uks-kvrms01perfuks-003 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvrms01perfuks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "79d09062-5673-41f1-be1c-c484c8e3accb" # "azml-rms-perf-uks-01" = (Enterprise App) # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
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