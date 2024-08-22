
vm_network_interface_config = {
  vmla01perfuks-nic01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-perf-uks-la"
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "LA Runtime"
      application = "LA Runtime"
      datatype    = "tbc"
    }
    ip_configuration = {
      name                          = "internal"
      vnet_name                     = "vnet-mhra-perf-uks-h1s01"
      subnet_id                     = "snet-mhra-perf-uks-h1s01-data"
      private_ip_address_allocation = "Static"
      private_ip_address            = "10.25.20.133"
    }
    dns_servers                   = ["10.5.255.68", "10.5.255.132"]
    enable_ip_forwarding          = false
    enable_accelerated_networking = false
  }
}

managed_disk_config = {
  vmla01perfuks-data01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-perf-uks-la"
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
}

vm_config = {
  vmla01perfuks = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-perf-uks-la"
    tags = {
      costcentre       = "tbc"
      projectcode      = "tbc"
      owner            = "LA Runtime"
      application      = "LA Runtime"
      datatype         = "tbc"
      PatchingSchedule = "Monthly_3rdSun_0100_1800_Always_Reboot_n-1"
    }
    size                  = "Standard_D8ds_v5"
    admin_username        = "adminuser"
    network_interface_ids = ["vmla01perfuks-nic01"]
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
}

managed_disk_attachment_config = {
  disk-attachment-zone1-001 = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    managed_disk_name    = "vmla01perfuks-data01"
    virtual_machine_name = "vmla01perfuks"
    lun                  = "10"
    caching              = "None"
    create_option        = "Attach"
  }
}

azurerm_virtual_machine_extension_config = {
  vmla01perfuks-ext-omsagent = {
    provider_alias       = "spoke1-sub"
    is_applicable        = true
    virtual_machine_name = "vmla01perfuks"
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
  rs01perfuks = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "Platform"
      application = "Platform"
      datatype    = "tbc"
    }
    resource_group_name = "rg-mhra-perf-uks-backup"
    sku                 = "Standard"
    soft_delete_enabled = true
  }
}

azurerm_backup_policy_vm_config = {
  bkpiaasmhraperfuks-d14w0-2000 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    tags = {
      costcentre  = "tbc"
      projectcode = "tbc"
      owner       = "Platform"
      application = "Platform"
      datatype    = "tbc"
    }
    resource_group_name = "rg-mhra-perf-uks-backup"
    recovery_vault_name = "rs01perfuks"
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
  backup-protected-vm-001-perf = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-perf-uks-backup"
    recovery_vault_name = "rs01perfuks"
    source_vm_name      = "vmla01perfuks"
    backup_policy_name  = "bkpiaasmhraperfuks-d14w0-2000"
    exclude_disk_luns   = []
    include_disk_luns   = []
  }
}

# Assign appropriate role to the principal used for recovery service vault endpoint creation. 
# The RG listed below needs to be the RG that you plan to create the private endpoint in that you will attach to the RSV.

resource_role_config = [{
  is_applicable                    = true
  resource_name                    = "rg-mhra-perf-uks-network"
  resource_type                    = "resource-group"
  resource_provider                = "spoke1"
  role                             = "contributor"
  principal_provider_resource_name = "rs01perfuks"
  principal_provider_resource_type = "recovery-svc-vault"
}]
