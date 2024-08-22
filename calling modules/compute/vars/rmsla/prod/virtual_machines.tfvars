vm_network_interface_config = {
  vmla01produks-nic01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-la"
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA Runtime"
      application = "LA Runtime"
      datatype    = "tbc"
    }
    ip_configuration = {
      name                          = "internal"
      vnet_name                     = "vnet-mhra-prod-uks-h1s01"
      subnet_id                     = "snet-mhra-prod-uks-h1s01-data"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.18.20.133"
    }
    dns_servers                   = ["10.5.255.68", "10.5.255.132"]  
    enable_ip_forwarding          = false
    enable_accelerated_networking = false
  }

    vmla02produks-nic01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-la"
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA Runtime"
      application = "LA Runtime"
      datatype    = "tbc"
    }
    ip_configuration = {
      name                          = "internal"
      vnet_name                     = "vnet-mhra-prod-uks-h1s01"
      subnet_id                     = "snet-mhra-prod-uks-h1s01-data"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.18.20.138"
    }
    dns_servers                   = ["10.5.255.68", "10.5.255.132"]  
    enable_ip_forwarding          = false
    enable_accelerated_networking = false
  }

vmectd01produks-nic01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-rms-ectd"
    tags = {
      costcentre  = "T3300"
      projectcode = "UID00437"
      owner       = "LA Runtime"
      application = "DocuBridge eCTD"
      datatype    = "tbc"
    }
    ip_configuration = {
      name                          = "internal"
      vnet_name                     = "vnet-mhra-prod-uks-h1s01"
      subnet_id                     = "snet-mhra-prod-uks-h1s01-app"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.18.16.25"
    }
    dns_servers                   = ["10.5.255.68", "10.5.255.132"]
    enable_ip_forwarding          = false
    enable_accelerated_networking = false
  }

    #vmshir01produks nic
  vmshir01produks-nic01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-rc-reporting"
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "RC"
      application = "Reporting"
      datatype    = "tbc"
    }
    ip_configuration = {
      name                          = "internal"
      vnet_name                     = "vnet-mhra-prod-uks-h1s01"
      subnet_id                     = "snet-mhra-prod-uks-h1s01-data"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.18.20.32"
    }
    dns_servers                   = ["10.5.255.68", "10.5.255.132"]
    enable_ip_forwarding          = false
    enable_accelerated_networking = false
  }
}

managed_disk_config = {
  vmla01produks-data01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-la"
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA Runtime"
      application = "LA Runtime"
      datatype    = "tbc"
    }
    storage_account_type          = "Standard_LRS"
    create_option                 = "Empty"
    disk_size_gb                  = "32"
    os_type                       = "Windows"
    public_network_access_enabled = true
    zone                          = "1"
    network_access_policy         = "AllowAll"
  }
  vmla02produks-data01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-la"
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA Runtime"
      application = "LA Runtime"
      datatype    = "tbc"
    }
    storage_account_type          = "Standard_LRS"
    create_option                 = "Empty"
    disk_size_gb                  = "32"
    os_type                       = "Windows"
    public_network_access_enabled = true
    zone                          = "1"
    network_access_policy         = "AllowAll"
  }
vmectd01produks-data01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-rms-ectd"
    tags = {
      costcentre  = "T3300"
      projectcode = "UID00437"
      owner       = "LA Runtime"
      application = "DocuBridge eCTD"
      datatype    = "tbc"
    }
    storage_account_type          = "Premium_LRS"
    create_option                 = "Empty"
    disk_size_gb                  = "256"
    os_type                       = "Windows"
    public_network_access_enabled = true
    zone                          = "1"
    network_access_policy         = "AllowAll"
  }
/*
vmectd01produks-data02 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-rms-ectd"
    tags = {
      costcentre  = "T3300"
      projectcode = "UID00437"
      owner       = "LA Runtime"
      application = "DocuBridge eCTD"
      datatype    = "tbc"
    }
    storage_account_type          = "Premium_LRS"
    create_option                 = "Empty"
    disk_size_gb                  = "256"
    os_type                       = "Windows"
    public_network_access_enabled = true
    zone                          = "1"
    network_access_policy         = "AllowAll"
  }
*/

 #vmshir01produks data disk 01
  vmshir01produks-data01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-rc-reporting"
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "RC"
      application = "Reporting"
      datatype    = "tbc"
    }
    storage_account_type          = "Standard_LRS"
    create_option                 = "Empty"
    disk_size_gb                  = "32"
    os_type                       = "Windows"
    public_network_access_enabled = true
    zone                          = "1"
    network_access_policy         = "AllowAll"
  }
}

vm_config = {
  vmla01produks = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-la"
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA Runtime"
      application = "LA Runtime"
      datatype    = "tbc"
      PatchingSchedule = "Monthly_3rdSun_0100_1800_Always_Reboot_n-1"
    }
    size                  = "Standard_E16bds_v5"
    admin_username        = "adminuser"
    network_interface_ids = ["vmla01produks-nic01"]
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
      name                 = ""
    }
    source_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2019-Datacenter"
      version   = "latest"
    }
    zone                       = "1"
    identity = {
      type         = "SystemAssigned"
      identity_ids = []
    }
    encryption_at_host_enabled = false
    patch_assessment_mode = "AutomaticByPlatform"
    patch_mode            = "AutomaticByOS"
  }
  vmla02produks = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-la"
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA Runtime"
      application = "LA Runtime"
      datatype    = "tbc"
      PatchingSchedule = "Monthly_3rdSun_0100_1800_Always_Reboot_n-1"
    }
    size                  = "Standard_E16bds_v5"
    admin_username        = "adminuser"
    network_interface_ids = ["vmla02produks-nic01"]
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
      name                 = ""
    }
    source_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2019-Datacenter"
      version   = "latest"
    }
    zone                       = "1"
    identity = {
      type         = "SystemAssigned"
      identity_ids = []
    }
    encryption_at_host_enabled = false
    patch_assessment_mode = "AutomaticByPlatform"
    patch_mode            = "AutomaticByOS"
  }
vmectd01produks = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-rms-ectd"
    tags = {
      costcentre  = "T3300"
      projectcode = "UID00437"
      owner       = "LA Runtime"
      application = "DocuBridge eCTD"
      role        = "applicationserver"
      name        = "vmectd01produks"
      PatchingSchedule = "Monthly_3rdSun_0100_1800_Always_Reboot_n-1"
    }
    size                  = "Standard_B16ms"
    admin_username        = "adminuser"
    network_interface_ids = ["vmectd01produks-nic01"]
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Premium_LRS"
      name                 = ""
    }
    source_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2022-Datacenter"
      version   = "latest"
    }
    zone                       = "1"
    identity = {
      type         = "SystemAssigned"
      identity_ids = []
    }
    encryption_at_host_enabled = false
    patch_assessment_mode = "AutomaticByPlatform"
    patch_mode            = "AutomaticByOS"
  }

  #vmshir01produks VM
  vmshir01produks = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-rc-reporting"
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "RC"
      application = "Reporting"
      role        = "Data Management and Analytics"
      name        = "vmshir01produks"
      PatchingSchedule = "Monthly_3rdSun_0100_1800_Always_Reboot_n-1"
      shutdownSchedule = "24x7"
    }
    size                  = "Standard_B4ls_v2"
    admin_username        = "adminuser"
    network_interface_ids = ["vmshir01produks-nic01"]
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
      name                 = ""
    }
    source_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2022-Datacenter"
      version   = "latest"
    }
    zone                       = "1"
    identity = {
      type         = "SystemAssigned"
      identity_ids = []
    }
    encryption_at_host_enabled = false
    patch_mode                 = "AutomaticByPlatform"
    allow_extension_operations = true
    enable_automatic_updates   = true
    provision_vm_agent         = true
  }
}

managed_disk_attachment_config = {
  disk-attachment-zone1-001 = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    managed_disk_name    = "vmla01produks-data01"
    virtual_machine_name = "vmla01produks"
    lun                  = "10"
    caching              = "None"
    create_option        = "Attach"
  }
  /*
  disk-attachment-zone1-003 = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    managed_disk_name    = "vmla02produks-data01"
    virtual_machine_name = "vmla02produks"
    lun                  = "10"
    caching              = "None"
    create_option        = "Attach"
  }
  */
disk-attachment-zone1-002 = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    managed_disk_name    = "vmectd01produks-data01"
    virtual_machine_name = "vmectd01produks"
    lun                  = "0"
    caching              = "ReadOnly"
    create_option        = "Attach"
  }
  /*
disk-attachment-zone1-003 = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    managed_disk_name    = "vmectd01produks-data02"
    virtual_machine_name = "vmectd01produks"
    lun                  = "1"
    caching              = "ReadOnly"
    create_option        = "Attach"
  }
  */
disk-attachment-zone1-004 = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    managed_disk_name    = "vmshir01produks-data01"
    virtual_machine_name = "vmshir01produks"
    lun                  = "0"
    caching              = "ReadOnly"
    create_option        = "Attach"
  }
}

azurerm_virtual_machine_extension_config = {
  vmla01produks-ext-omsagent = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    virtual_machine_name = "vmla01produks"
    publisher            = "Microsoft.EnterpriseCloud.Monitoring"
    type                 = "MicrosoftMonitoringAgent"
    type_handler_version = "1.0"
    settings             = ""                    # workspaceID of the log analytics workspace. This value is obtained via an output of the monitor module.
    protected_settings   = ""                    # workspaceKey of the log analytics workspace. This value is obtained via an output of the monitor module.
    misc_data            = "lw-mhra-mgmt-uks-01" # name of log analytics workspace that the extension needs to connect with.
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA Runtime"
      application = "LA Runtime"
      datatype    = "tbc"
    }
  }
  vmla02produks-ext-omsagent = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    virtual_machine_name = "vmla02produks"
    publisher            = "Microsoft.EnterpriseCloud.Monitoring"
    type                 = "MicrosoftMonitoringAgent"
    type_handler_version = "1.0"
    settings             = ""                    # workspaceID of the log analytics workspace. This value is obtained via an output of the monitor module.
    protected_settings   = ""                    # workspaceKey of the log analytics workspace. This value is obtained via an output of the monitor module.
    misc_data            = "lw-mhra-mgmt-uks-01" # name of log analytics workspace that the extension needs to connect with.
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA Runtime"
      application = "LA Runtime"
      datatype    = "tbc"
    }
  }
vmectd01produks-ext-omsagent = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    virtual_machine_name = "vmectd01produks"
    publisher            = "Microsoft.EnterpriseCloud.Monitoring"
    type                 = "MicrosoftMonitoringAgent"
    type_handler_version = "1.0"
    settings             = ""                    # workspaceID of the log analytics workspace. This value is obtained via an output of the monitor module.
    protected_settings   = ""                    # workspaceKey of the log analytics workspace. This value is obtained via an output of the monitor module.
    misc_data            = "lw-mhra-mgmt-uks-01" # name of log analytics workspace that the extension needs to connect with.
    tags = {
      costcentre  = "T3300"
      projectcode = "UID00437"
      owner       = "LA Runtime"
      application = "DocuBridge eCTD"
      datatype    = "tbc"
    }
  }

}

azurerm_recovery_services_vault_config = {
  rs01produks = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "Platform"
      application = "Platform"
      datatype    = "tbc"
    }
    resource_group_name = "rg-mhra-prod-uks-backup"
    sku                 = "Standard"
    soft_delete_enabled = true
  }
}

azurerm_backup_policy_vm_config = {
  bkpiaasmhraproduks-d14w0-2000 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "Platform"
      application = "Platform"
      datatype    = "tbc"
    }
    resource_group_name = "rg-mhra-prod-uks-backup"
    recovery_vault_name = "rs01produks"
    timezone            = "UTC"
    backup = {
      frequency = "Daily"
      time      = "20:00"
    }
    retention_daily = {
      count = 7
    }
  }
}

azurerm_backup_protected_vm_config = {
  backup-protected-vm-001-prod = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-backup"
    recovery_vault_name = "rs01produks"
    source_vm_name      = "vmla01produks"
    backup_policy_name  = "bkpiaasmhraproduks-d14w0-2000"
    exclude_disk_luns   = []
    include_disk_luns   = []
  }
  backup-protected-vm-002-prod = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-backup"
    recovery_vault_name = "rs01produks"
    source_vm_name      = "vmectd01produks"
    backup_policy_name  = "bkpiaasmhraproduks-d14w0-2000"
    exclude_disk_luns   = []
    include_disk_luns   = []
  }
  backup-protected-vm-003-prod = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-backup"
    recovery_vault_name = "rs01produks"
    source_vm_name      = "vmla02produks"
    backup_policy_name  = "bkpiaasmhraproduks-d14w0-2000"
    exclude_disk_luns   = []
    include_disk_luns   = []
  }
  #vmshir01produks backup protected vm policy assignment
    backup-protected-vm-004-prod = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-backup"
    recovery_vault_name = "rs01produks"
    source_vm_name      = "vmshir01produks"
    backup_policy_name  = "bkpiaasmhraproduks-d14w0-2000"
    exclude_disk_luns   = []
    include_disk_luns   = []
  }
}

# Assign appropriate role to the principal used for recovery service vault endpoint creation. 
# The RG listed below needs to be the RG that you plan to create the private endpoint in that you will attach to the RSV.

resource_role_config = [{
  is_applicable                    = true
  resource_name                    = "rg-mhra-prod-uks-network"
  resource_type                    = "resource-group"
  resource_provider                = "spoke1"
  role                             = "contributor"
  principal_provider_resource_name = "rs01produks"
  principal_provider_resource_type = "recovery-svc-vault"
}]
