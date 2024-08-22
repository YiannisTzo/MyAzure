# Security module

# Key vault details
key_vaults = {
  kvrms01devuks = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-dev-uks-rms"
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

    kvrms02devuks = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-dev-uks-rms"
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

  kvla01devuks = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-dev-uks-la"
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

  kvappgw01devuks = {
    provider_alias                  = "spoke1-sub"
    is_applicable                   = true
    resource_group_name             = "rg-mhra-dev-uks-network"
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
      whitelist_public_ips_or_cidrs = []
      subnets_config = {
        vnet-mhra-dev01-uks-h1s01 = ["snet-mhra-dev01-uks-h1s01-waf"]
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

  kvap-mhra-dev-uks-kvappgw01devuks-001 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvappgw01devuks"
    application_id = "" # optional attribute to declare the object ID of an application in AAD.
    object_id      = "" # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = "uami" # user assigned managed identity
      name          = "id-mhra-ident-dev-uks-apgw-001"
    }
    key_permissions         = ["Get", "List", "Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

  kvap-mhra-dev-uks-kvla01devuks-001 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvla01devuks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "e395e975-b3b5-4331-b925-cbfe950cefde" # "MHRA-LZ-DEVELOPMENT" # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

  kvap-mhra-dev-uks-kvla01devuks-002 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvla01devuks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "0b23849e-f4b1-4660-a1fd-d4227b4f1ebb" # "sg-rg-mhra-dev-uks-la-contributor" # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

  kvap-mhra-dev-uks-kvla01devuks-003 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvla01devuks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "abaabf94-b307-43d4-b646-7375b31cdd01" # "adf-la-dev-uks-01" (Enterprise App) # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

  kvap-mhra-dev-uks-kvrms01devuks-001 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvrms01devuks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "cc4119ed-4af5-4d74-ab7f-2ce69d7ac91f" # "sg-rg-mhra-dev-uks-rms-contributor"  # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

    kvap-mhra-dev-uks-kvrms02devuks-001 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvrms02devuks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "cc4119ed-4af5-4d74-ab7f-2ce69d7ac91f" # "sg-rg-mhra-dev-uks-rms-contributor"  # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

  kvap-mhra-dev-uks-kvrms01devuks-002 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvrms01devuks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "e395e975-b3b5-4331-b925-cbfe950cefde" # "MHRA-LZ-DEVELOPMENT" (enterprise App)  # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

    kvap-mhra-dev-uks-kvrms02devuks-002 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvrms02devuks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "e395e975-b3b5-4331-b925-cbfe950cefde" # "MHRA-LZ-DEVELOPMENT" (enterprise App)  # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

  kvap-mhra-dev-uks-kvrms01devuks-003 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvrms01devuks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "0571b853-ee6f-4774-84b1-7092b6511b36" # Unknown Account # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

    kvap-mhra-dev-uks-kvrms02devuks-003 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvrms02devuks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "0571b853-ee6f-4774-84b1-7092b6511b36" # Unknown Account # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

  kvap-mhra-dev-uks-kvrms01devuks-004 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvrms01devuks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "507ca1c5-800d-4d22-abc8-6b80f7145be2" # "azml-rms-dev-uks-01" = (Enterprise App) # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }

  kvap-mhra-dev-uks-kvrms02devuks-004 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    key_vault_name = "kvrms02devuks"
    application_id = ""                                     # optional attribute to declare the object ID of an application in AAD.
    object_id      = "507ca1c5-800d-4d22-abc8-6b80f7145be2" # "azml-rms-dev-uks-01" = (Enterprise App) # Required - object ID of a user, SP, or SG in AAD that has been created outside TF.
    object_id_config = {
      resource_type = ""
      name          = ""
    }
    key_permissions         = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "GetRotationPolicy", "SetRotationPolicy", "Rotate"]
    secret_permissions      = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore"]
    certificate_permissions = ["Get", "List", "Update", "Create", "Import", "Delete", "Recover", "Backup", "Restore", "ManageContacts", "ManageIssuers", "GetIssuers", "ListIssuers", "SetIssuers", "DeleteIssuers"]
    storage_permissions     = []
  }
}
