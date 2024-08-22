vm_network_interface_config = {
    #vmla01devuks nic
  vmla01devuks-nic01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-la"
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA Runtime"
      application = "LA Runtime"
      datatype    = "tbc"
    }
    ip_configuration = {
      name                          = "internal"
      vnet_name                     = "vnet-mhra-dev01-uks-h1s01"
      subnet_id                     = "snet-mhra-dev01-uks-h1s01-data"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.16.20.133"
    }
    dns_servers                   = ["10.5.255.68", "10.5.255.132"]
    enable_ip_forwarding          = false
    enable_accelerated_networking = false
  }

  #vmectd01devuks nic
vmectd01devuks-nic01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-rms-ectd"
    tags = {
      costcentre  = "T3300"
      projectcode = "UID00437"
      owner       = "LA Runtime"
      application = "DocuBridge eCTD"
      datatype    = "tbc"
    }
    ip_configuration = {
      name                          = "internal"
      vnet_name                     = "vnet-mhra-dev01-uks-h1s01"
      subnet_id                     = "snet-mhra-dev01-uks-h1s01-app"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.16.16.30"
    }
    dns_servers                   = ["10.5.255.68", "10.5.255.132"]
    enable_ip_forwarding          = false
    enable_accelerated_networking = false
  }

    #vmshir01devuks nic
  vmshir01devuks-nic01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-rc-reporting"
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "RC"
      application = "Reporting"
      datatype    = "tbc"
    }
    ip_configuration = {
      name                          = "internal"
      vnet_name                     = "vnet-mhra-dev01-uks-h1s01"
      subnet_id                     = "snet-mhra-dev01-uks-h1s01-data"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.16.20.32"
    }
    dns_servers                   = ["10.5.255.68", "10.5.255.132"]
    enable_ip_forwarding          = false
    enable_accelerated_networking = false
  }
}

managed_disk_config = {
  #vmla01devuks data disk 01
  vmla01devuks-data01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-la"
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

  #vmectd01devuks data disk 01
vmectd01devuks-data01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-rms-ectd"
    tags = {
      costcentre  = "T3300"
      projectcode = "UID00437"
      owner       = "LA Runtime"
      application = "DocuBridge eCTD"
      datatype    = "tbc"
    }
    storage_account_type          = "StandardSSD_LRS"
    create_option                 = "Empty"
    disk_size_gb                  = "256"
    os_type                       = "Windows"
    public_network_access_enabled = true
    zone                          = "1"
    network_access_policy         = "AllowAll"
  }
/*
vmectd01devuks-data02 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-rms-ectd"
    tags = {
      costcentre  = "T3300"
      projectcode = "UID00437"
      owner       = "LA Runtime"
      application = "DocuBridge eCTD"
      datatype    = "tbc"
    }
    storage_account_type          = "StandardSSD_LRS"
    create_option                 = "Empty"
    disk_size_gb                  = "256"
    os_type                       = "Windows"
    public_network_access_enabled = true
    zone                          = "1"
    network_access_policy         = "AllowAll"
  }
  */

 #vmshir01devuks data disk 01
  vmshir01devuks-data01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-rc-reporting"
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
  vmla01devuks = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-la"
    tags = {
      costcentre          = "tbc"
      projectcode         = "tbc"
      owner               = "LA Runtime"
      application         = "LA Runtime"
      datatype            = "tbc"
      PatchingSchedule    = "Monthly_3rdSat_0100_1800_Always_Reboot_n0"
      PowerOffOnSchedule  = "05:00-20:00:on;Sat:off;Sun:off;3rdSat:on;3rdSun:on"
      shutdownSchedule    = "20:00 -> 05:00, Saturday, Sunday"
    }
    size                  = "Standard_D8ds_v5"
    admin_username        = "adminuser"
    network_interface_ids = ["vmla01devuks-nic01"]
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
    patch_mode                 = "AutomaticByPlatform"
    allow_extension_operations = true
    enable_automatic_updates   = true
    provision_vm_agent         = true
  }

vmectd01devuks = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-rms-ectd"
    tags = {
      costcentre  = "T3300"
      projectcode = "UID00437"
      owner       = "LA Runtime"
      application = "DocuBridge eCTD"
      role        = "applicationserver"
      name        = "vmectd01devuks"
      PatchingSchedule = "Monthly_3rdSat_0100_1800_Always_Reboot_n0"
    }
    size                  = "Standard_B12ms"
    admin_username        = "adminuser"
    network_interface_ids = ["vmectd01devuks-nic01"]
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

  #vmshir01devuks VM
  vmshir01devuks = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-rc-reporting"
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "RC"
      application = "Reporting"
      role        = "Data Management and Analytics"
      name        = "vmshir01devuks"
      PatchingSchedule = "Monthly_3rdSat_0100_1800_Always_Reboot_n0"
      shutdownSchedule = "24x7"
    }
    size                  = "Standard_B4ls_v2"
    admin_username        = "adminuser"
    network_interface_ids = ["vmshir01devuks-nic01"]
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
    managed_disk_name    = "vmla01devuks-data01"
    virtual_machine_name = "vmla01devuks"
    lun                  = "0"
    caching              = "ReadOnly"
    create_option        = "Attach"
  }
disk-attachment-zone1-002 = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    managed_disk_name    = "vmectd01devuks-data01"
    virtual_machine_name = "vmectd01devuks"
    lun                  = "0"
    caching              = "ReadOnly"
    create_option        = "Attach"
  }
  /*
disk-attachment-zone1-003 = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    managed_disk_name    = "vmectd01devuks-data02"
    virtual_machine_name = "vmectd01devuks"
    lun                  = "1"
    caching              = "ReadOnly"
    create_option        = "Attach"
  }
  */
disk-attachment-zone1-004 = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    managed_disk_name    = "vmshir01devuks-data01"
    virtual_machine_name = "vmshir01devuks"
    lun                  = "0"
    caching              = "ReadOnly"
    create_option        = "Attach"
  }
}

azurerm_virtual_machine_extension_config = {
vmectd01devuks-ext-omsagent = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    virtual_machine_name = "vmectd01devuks"
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
  rs01devuks = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "Platform"
      application = "Platform"
      datatype    = "tbc"
    }
    resource_group_name = "rg-mhra-dev-uks-backup"
    sku                 = "Standard"
    soft_delete_enabled = true
  }
}

azurerm_backup_policy_vm_config = {
  bkpiaasmhradevuks-d14w0-2000 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "Platform"
      application = "Platform"
      datatype    = "tbc"
    }
    resource_group_name = "rg-mhra-dev-uks-backup"
    recovery_vault_name = "rs01devuks"
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
  backup-protected-vm-001-dev = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-backup"
    recovery_vault_name = "rs01devuks"
    source_vm_name      = "vmla01devuks"
    backup_policy_name  = "bkpiaasmhradevuks-d14w0-2000"
    exclude_disk_luns   = []
    include_disk_luns   = []
  }
backup-protected-vm-002-dev = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-backup"
    recovery_vault_name = "rs01devuks"
    source_vm_name      = "vmectd01devuks"
    backup_policy_name  = "bkpiaasmhradevuks-d14w0-2000"
    exclude_disk_luns   = []
    include_disk_luns   = []
  }

  #vmshir01devuks backup protected vm policy assignment
    backup-protected-vm-003-dev = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-backup"
    recovery_vault_name = "rs01devuks"
    source_vm_name      = "vmshir01devuks"
    backup_policy_name  = "bkpiaasmhradevuks-d14w0-2000"
    exclude_disk_luns   = []
    include_disk_luns   = []
  }
}

# Assign appropriate role to the principal used for recovery service vault endpoint creation. 
# The RG listed below needs to be the RG that you plan to create the private endpoint in that you will attach to the RSV.

resource_role_config = [{
  is_applicable                    = true
  resource_name                    = "rg-mhra-dev-uks-network"
  resource_type                    = "resource-group"
  resource_provider                = "spoke1"
  role                             = "contributor"
  principal_provider_resource_name = "rs01devuks"
  principal_provider_resource_type = "recovery-svc-vault"
}]
