locals {
  managed_disk_config_by_provider = {
    for ko, vo in distinct([for ki, vi in var.managed_disk_config : vi.provider_alias]) : vo => {
      for kii, vii in var.managed_disk_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }
  managed_disk_attachment_config_by_provider = {
    for ko, vo in distinct([for ki, vi in var.managed_disk_attachment_config : vi.provider_alias]) : vo => {
      for kii, vii in var.managed_disk_attachment_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }
  vm_config_by_provider = {
    for ko, vo in distinct([for ki, vi in var.vm_config : vi.provider_alias]) : vo => {
      for kii, vii in var.vm_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }
  vm_network_interface_config_by_provider = {
    for ko, vo in distinct([for ki, vi in var.vm_network_interface_config : vi.provider_alias]) : vo => {
      for kii, vii in var.vm_network_interface_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }

  azurerm_virtual_machine_extension_config_by_provider = {
    for ko, vo in distinct([for ki, vi in var.azurerm_virtual_machine_extension_config : vi.provider_alias]) : vo => {
      for kii, vii in var.azurerm_virtual_machine_extension_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }

  azurerm_recovery_services_vault_config_by_provider = {
    for ko, vo in distinct([for ki, vi in var.azurerm_recovery_services_vault_config : vi.provider_alias]) : vo => {
      for kii, vii in var.azurerm_recovery_services_vault_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }

  azurerm_backup_policy_vm_config_by_provider = {
    for ko, vo in distinct([for ki, vi in var.azurerm_backup_policy_vm_config : vi.provider_alias]) : vo => {
      for kii, vii in var.azurerm_backup_policy_vm_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }

  azurerm_backup_protected_vm_config_by_provider = {
    for ko, vo in distinct([for ki, vi in var.azurerm_backup_protected_vm_config : vi.provider_alias]) : vo => {
      for kii, vii in var.azurerm_backup_protected_vm_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }

  resources_by_type = {
    resource-group     = data.terraform_remote_state.resource_group_resources.outputs.o_resource_group
    recovery-svc-vault = module.rsv_development.o_recovery_svc_vaults
  }

  resource_role_assignments = [
    for k, v in var.resource_role_config : {
      scope          = local.resources_by_type[v.resource_type][v.resource_provider][v.resource_name].id
      role           = v.role
      principal_type = ""
      principal_id   = local.resources_by_type[v.principal_provider_resource_type][v.principal_provider_resource_name].identity[0].principal_id
    } if v.is_applicable
  ]
}

# Creation of recovery services vault
module "rsv_development" {
  source                                   = "../../shared/compute/virtual_machines"
  vm_network_interface_config              = {}
  vm_config                                = {}
  managed_disk_config                      = {}
  managed_disk_attachment_config           = {}
  azurerm_virtual_machine_extension_config = {}
  azurerm_backup_policy_vm_config          = {}
  azurerm_recovery_services_vault_config   = local.azurerm_recovery_services_vault_config_by_provider["spoke1-sub"]
  azurerm_backup_protected_vm_config       = {}
  global_tags                              = var.global_tags
  region                                   = var.region
  crud_timeouts                            = var.crud_timeouts
  ref_data = {
    subnet_data             = {}
    admin_password          = {}
    log_analytics_workspace = {}
  }
  providers = {
    azurerm = azurerm.spoke1-sub
  }
}

# Assign appropriate role to the principal used for recovery service vault endpoint creation. 
module "connectivity_identity" {
  source               = "../../shared/identity/identity"
  depends_on           = [module.rsv_development.o_recovery_svc_vaults]
  resource_role_config = local.resource_role_assignments
  region               = var.region
  global_tags          = var.global_tags
  crud_timeouts        = var.crud_timeouts
}

# Creation of virtual machine config + backup policies
module "virtual_machines_development" {
  source                                   = "../../shared/compute/virtual_machines"
  vm_network_interface_config              = local.vm_network_interface_config_by_provider["spoke1-sub"]
  vm_config                                = local.vm_config_by_provider["spoke1-sub"]
  managed_disk_config                      = local.managed_disk_config_by_provider["spoke1-sub"]
  managed_disk_attachment_config           = local.managed_disk_attachment_config_by_provider["spoke1-sub"]
  azurerm_virtual_machine_extension_config = lookup(local.azurerm_virtual_machine_extension_config_by_provider, "spoke1-sub", {})
  azurerm_backup_policy_vm_config          = local.azurerm_backup_policy_vm_config_by_provider["spoke1-sub"]
  azurerm_recovery_services_vault_config   = {}
  azurerm_backup_protected_vm_config       = local.azurerm_backup_protected_vm_config_by_provider["spoke1-sub"]
  global_tags                              = var.global_tags
  region                                   = var.region
  crud_timeouts                            = var.crud_timeouts
  ref_data = {
    subnet_data             = data.terraform_remote_state.network_resources.outputs.o_subnets.spoke1
    admin_password          = var.vm_admin_pwd
    log_analytics_workspace = data.terraform_remote_state.monitor_resources.outputs.o_log_analytics_workspaces.management
  }
  providers = {
    azurerm = azurerm.spoke1-sub
  }
}
