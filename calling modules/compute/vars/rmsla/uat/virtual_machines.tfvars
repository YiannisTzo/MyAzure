vm_network_interface_config = {
  vmla01uatuks-nic01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-uat-uks-la"
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA Runtime"
      application = "LA Runtime"
      datatype    = "tbc"
    }
    ip_configuration = {
      name                          = "internal"
      vnet_name                     = "vnet-mhra-uat-uks-h1s01"
      subnet_id                     = "snet-mhra-uat-uks-h1s01-data"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.17.20.133"
    }
    dns_servers                   = ["10.5.255.68", "10.5.255.132"]
    enable_ip_forwarding          = false
    enable_accelerated_networking = false
  }
  vmectd01uatuks-nic01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-uat-uks-rms-ectd"
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "tbc"
      application = "tbc"
      datatype    = "tbc"
    }
    ip_configuration = {
      name                          = "internal"
      vnet_name                     = "vnet-mhra-uat-uks-h1s01"
      subnet_id                     = "snet-mhra-uat-uks-h1s01-app"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.17.16.20"
    }
    dns_servers                   = ["10.5.255.68", "10.5.255.132"]
    enable_ip_forwarding          = false
    enable_accelerated_networking = false
  }

#vmshir01uatuks nic
  vmshir01uatuks-nic01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-uat-uks-rc-reporting"
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "RC"
      application = "Reporting"
      datatype    = "tbc"
    }
    ip_configuration = {
      name                          = "internal"
      vnet_name                     = "vnet-mhra-uat-uks-h1s01"
      subnet_id                     = "snet-mhra-uat-uks-h1s01-data"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.17.20.32"
    }
    dns_servers                   = ["10.5.255.68", "10.5.255.132"]
    enable_ip_forwarding          = false
    enable_accelerated_networking = false
  }
}

managed_disk_config = {
  vmla01uatuks-data01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-uat-uks-la"
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

  vmectd01uatuks-data01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-uat-uks-rms-ectd"
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "tbc"
      application = "tbc"
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
  vmectd01uatuks-data02 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-uat-uks-rms-ectd"
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "tbc"
      application = "tbc"
      datatype    = "tbc"
    }
    storage_account_type          = "Standard_LRS"
    create_option                 = "Empty"
    disk_size_gb                  = "256"
    os_type                       = "Windows"
    public_network_access_enabled = true
    zone                          = "1"
    network_access_policy         = "AllowAll"
  }
*/
#vmshir01uatuks data disk 01
  vmshir01uatuks-data01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-uat-uks-rc-reporting"
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
  vmla01uatuks = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-uat-uks-la"
    tags = {
      costcentre       = "tbc"
      projectcode      = "tbc"
      owner            = "LA Runtime"
      application      = "LA Runtime"
      datatype         = "tbc"
      PatchingSchedule = "Monthly_3rdSun_0100_1800_Always_Reboot_n-1"
      shutdownSchedule = "20:00 -> 05:00, Saturday, Sunday"
    }
    size                  = "Standard_D8ds_v5"
    admin_username        = "adminuser"
    network_interface_ids = ["vmla01uatuks-nic01"]
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
    encryption_at_host_enabled = false
    identity = {
      type         = "SystemAssigned"
      identity_ids = []
    }
  }
  vmectd01uatuks = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-uat-uks-rms-ectd"
    tags = {
      costcentre       = "T3300"
      projectcode      = "UID00437"
      owner            = "LA Runtime"
      application      = "DocuBridge eCTD"
      datatype         = "tbc"
      Role             = "applicationserver"
      PatchingSchedule = "Monthly_3rdSun_0100_1800_Always_Reboot_n-1"
    }
    size                  = "Standard_B12ms"
    admin_username        = "adminuser"
    network_interface_ids = ["vmectd01uatuks-nic01"]
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
    zone = "1"
    identity = {
      type         = "SystemAssigned"
      identity_ids = []
    }
    encryption_at_host_enabled = false
  }

#vmshir01uatuks VM
  vmshir01uatuks = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-uat-uks-rc-reporting"
    tags = {
      costcentre       = "tbc"
      projectcode      = "tbc"
      owner            = "RC"
      application      = "Reporting"
      datatype         = "tbc"
      Role             = "Data Management and Analytics"
      PatchingSchedule = "Monthly_3rdSat_0100_1800_Always_Reboot_n0"
      shutdownSchedule = "24x7"
    }
    size                  = "Standard_B4ls_v2"
    admin_username        = "adminuser"
    network_interface_ids = ["vmshir01uatuks-nic01"]
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
    zone = "1"
    identity = {
      type         = "SystemAssigned"
      identity_ids = []
    }
    encryption_at_host_enabled = false
  }
}

managed_disk_attachment_config = {
  disk-attachment-zone1-001 = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    managed_disk_name    = "vmla01uatuks-data01"
    virtual_machine_name = "vmla01uatuks"
    lun                  = "10"
    caching              = "None"
    create_option        = "Attach"
  }
  disk-attachment-zone1-002 = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    managed_disk_name    = "vmectd01uatuks-data01"
    virtual_machine_name = "vmectd01uatuks"
    lun                  = "0"
    caching              = "None"
    create_option        = "Attach"
  }
  /*
  disk-attachment-zone1-003 = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    managed_disk_name    = "vmectd01uatuks-data02"
    virtual_machine_name = "vmectd01uatuks"
    lun                  = "1"
    caching              = "None"
    create_option        = "Attach"
  }
  */
disk-attachment-zone1-004 = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    managed_disk_name    = "vmshir01uatuks-data01"
    virtual_machine_name = "vmshir01uatuks"
    lun                  = "0"
    caching              = "ReadOnly"
    create_option        = "Attach"
  }
}

azurerm_virtual_machine_extension_config = {
  vmla01uatuks-ext-omsagent = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    virtual_machine_name = "vmla01uatuks"
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
  vmectd01uatuks-ext-omsagent = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    virtual_machine_name = "vmectd01uatuks"
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

}

azurerm_recovery_services_vault_config = {
  rs01uatuks = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "Platform"
      application = "Platform"
      datatype    = "tbc"
    }
    resource_group_name = "rg-mhra-uat-uks-backup"
    sku                 = "Standard"
    soft_delete_enabled = true
  }
}

azurerm_backup_policy_vm_config = {
  bkpiaasmhrauatuks-d14w0-2000 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "Platform"
      application = "Platform"
      datatype    = "tbc"
    }
    resource_group_name = "rg-mhra-uat-uks-backup"
    recovery_vault_name = "rs01uatuks"
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
  backup-protected-vm-001-uat = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-uat-uks-backup"
    recovery_vault_name = "rs01uatuks"
    source_vm_name      = "vmla01uatuks"
    backup_policy_name  = "bkpiaasmhrauatuks-d14w0-2000"
    exclude_disk_luns   = []
    include_disk_luns   = []
  }
  backup-protected-vm-002-uat = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-uat-uks-backup"
    recovery_vault_name = "rs01uatuks"
    source_vm_name      = "vmectd01uatuks"
    backup_policy_name  = "bkpiaasmhrauatuks-d14w0-2000"
    exclude_disk_luns   = []
    include_disk_luns   = []
  }
  #vmshir01uatuks backup protected vm policy assignment
    backup-protected-vm-003-uat = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-uat-uks-backup"
    recovery_vault_name = "rs01uatuks"
    source_vm_name      = "vmshir01uatuks"
    backup_policy_name  = "bkpiaasmhrauatuks-d14w0-2000"
    exclude_disk_luns   = []
    include_disk_luns   = []
  }
}

# Assign appropriate role to the principal used for recovery service vault endpoint creation. 
# The RG listed below needs to be the RG that you plan to create the private endpoint in that you will attach to the RSV.

resource_role_config = [{
  is_applicable                    = true
  resource_name                    = "rg-mhra-uat-uks-network"
  resource_type                    = "resource-group"
  resource_provider                = "spoke1"
  role                             = "contributor"
  principal_provider_resource_name = "rs01uatuks"
  principal_provider_resource_type = "recovery-svc-vault"
}]
