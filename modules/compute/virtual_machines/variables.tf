variable "crud_timeouts" {
  type = map(string)
}

variable "global_tags" {
  type = map(string)
}

variable "region" {
  type = string
}
variable "vm_network_interface_config" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    resource_group_name = string
    tags                = map(string)
    ip_configuration = object({
      name                          = string
      subnet_id                     = string
      vnet_name                     = string
      private_ip_address_allocation = string
      private_ip_address            = string
    })
    dns_servers                   = list(string)
    enable_ip_forwarding          = bool
    enable_accelerated_networking = bool
  }))
}

variable "vm_config" {
  type = map(object({
    provider_alias        = string
    is_applicable         = bool
    resource_group_name   = string
    tags                  = map(string)
    size                  = string
    admin_username        = string
    network_interface_ids = list(string)
    os_disk = object({
      caching              = string
      storage_account_type = string
      name                 = string
    })
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    zone                       = string
    encryption_at_host_enabled = bool
    identity = optional(object({
      type           = string
      identity_names = optional(list(string))
    }))
  }))
}

variable "ref_data" {
  type = object({
    subnet_data             = any
    admin_password          = any
    log_analytics_workspace = any
  })
}

variable "managed_disk_config" {
  type = map(object({
    provider_alias        = string
    is_applicable         = bool
    resource_group_name   = string
    tags                  = map(string)
    storage_account_type  = string
    create_option         = string
    disk_size_gb          = string
    os_type               = string
    zone                  = string
    network_access_policy = string
  }))
}

variable "managed_disk_attachment_config" {
  type = map(object({
    provider_alias       = string
    is_applicable        = bool
    managed_disk_name    = string
    virtual_machine_name = string
    lun                  = string
    caching              = string
    create_option        = string
  }))
}

variable "azurerm_virtual_machine_extension_config" {
  type = map(object({
    provider_alias       = string
    is_applicable        = bool
    virtual_machine_name = string
    publisher            = string
    type                 = string
    type_handler_version = string
    settings             = string
    tags                 = map(string)
    protected_settings   = string
    misc_data            = string
  }))
}

variable "patch_assessment_mode" {
  description           = "(Optional) Specifies the mode of VM Guest Patching for the Virtual Machine."
  type                  = string
  default               = "AutomaticByPlatform"
}

variable "provision_vm_agent" {
  description           = "Should the Azure VM Agent be provisioned on this Virtual Machine?"
  type                  = bool
  default               = null
}

variable "enable_automatic_updates" {
  description = "Specifies if Automatic Updates are Enabled for the Windows Virtual Machine. Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "patch_mode" {
  description = "Specifies the mode of in-guest patching to this Windows Virtual Machine. Possible values are Manual, AutomaticByOS and AutomaticByPlatform. Defaults to AutomaticByOS."
  type        = string
  default     = null
}

variable "allow_extension_operations" {
  description = "Should Extension Operations be allowed on this Virtual Machine? Defaults to true."
  type        = bool
  default     = null
}

variable "azurerm_recovery_services_vault_config" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    tags                = map(string)
    resource_group_name = string
    sku                 = string
    soft_delete_enabled = bool
  }))
}

variable "azurerm_backup_policy_vm_config" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    tags                = map(string)
    resource_group_name = string
    recovery_vault_name = string
    timezone            = string
    backup = object({
      frequency = string
      time      = string
    })
    retention_daily = object({
      count = string
    })
    #    retention_weekly = object({
    #      count    = string
    #      weekdays = list(string)
    #    })
    #    retention_monthly = object({
    #      count    = string
    #      weekdays = list(string)
    #      weeks    = list(string)
    #    })
    #    retention_yearly = object({
    #      count    = string
    #      weekdays = list(string)
    #      weeks    = list(string)
    #      months   = list(string)
    #    })
  }))
}

variable "azurerm_backup_protected_vm_config" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    resource_group_name = string
    recovery_vault_name = string
    source_vm_name      = string
    backup_policy_name  = string
    exclude_disk_luns   = list(string)
    include_disk_luns   = list(string)
  }))
}
