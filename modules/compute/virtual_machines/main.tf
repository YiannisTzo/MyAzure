locals {
  nic_data = {
    for k, v in var.vm_config : k => [
      for ki, vi in v.network_interface_ids : azurerm_network_interface.vm_network_interface[vi].id
    ]
  }
}

resource "azurerm_network_interface" "vm_network_interface" {
  for_each            = var.vm_network_interface_config
  name                = each.key
  location            = var.region
  resource_group_name = each.value.resource_group_name
  tags                = merge(var.global_tags, each.value.tags)
  ip_forwarding_enabled = var.ip_forwarding_enabled
  accelerated_networking_enabled = var.accelerated_networking_enabled

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = var.ref_data.subnet_data[format("%s-%s", each.value.ip_configuration.vnet_name, each.value.ip_configuration.subnet_id)].id
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    private_ip_address            = each.value.ip_configuration.private_ip_address
  }
  dns_servers                   = each.value.dns_servers
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}

resource "azurerm_windows_virtual_machine" "vm_config" {
  for_each              = var.vm_config
  name                  = each.key
  resource_group_name   = each.value.resource_group_name
  tags                  = merge(var.global_tags, each.value.tags)
  location              = var.region
  size                  = each.value.size
  admin_username        = each.value.admin_username
  admin_password        = var.ref_data.admin_password
  network_interface_ids = local.nic_data[each.key]
  provision_vm_agent    = var.provision_vm_agent
  patch_assessment_mode = var.patch_assessment_mode
  enable_automatic_updates = var.enable_automatic_updates
  patch_mode               = var.patch_mode
  allow_extension_operations = var.allow_extension_operations
  os_disk {
    caching              = each.value.os_disk.caching
    storage_account_type = each.value.os_disk.storage_account_type
    name                 = each.value.os_disk.name == "" ? null : each.value.os_disk.name
  }

  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }

  zone                       = each.value.zone
  encryption_at_host_enabled = each.value.encryption_at_host_enabled
  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_names
    }
  }
  lifecycle {
    ignore_changes = [
      admin_password
      , admin_username
      , source_image_reference
      , allow_extension_operations
      , enable_automatic_updates
      , provision_vm_agent
      , patch_mode
    ]
    # Ignore lifecycle block added due to lack of support for source_image_reference / source_image_id, issue listed under https://github.com/hashicorp/terraform-provider-azurerm/issues/19614 / https://github.com/hashicorp/terraform-provider-azurerm/issues/8195
  }

}

resource "azurerm_managed_disk" "managed_disk" {
  for_each              = var.managed_disk_config
  name                  = each.key
  resource_group_name   = each.value.resource_group_name
  tags                  = merge(var.global_tags, each.value.tags)
  location              = var.region
  storage_account_type  = each.value.storage_account_type
  create_option         = each.value.create_option
  disk_size_gb          = each.value.disk_size_gb
  os_type               = each.value.os_type
  zone                  = each.value.zone
  network_access_policy = each.value.network_access_policy
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk_attachment" {
  for_each           = var.managed_disk_attachment_config
  managed_disk_id    = azurerm_managed_disk.managed_disk[each.value.managed_disk_name].id
  virtual_machine_id = azurerm_windows_virtual_machine.vm_config[each.value.virtual_machine_name].id
  lun                = each.value.lun
  caching            = each.value.caching
  create_option      = each.value.create_option
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}

resource "azurerm_virtual_machine_extension" "vm_extension" {
  for_each             = var.azurerm_virtual_machine_extension_config
  name                 = each.key
  virtual_machine_id   = azurerm_windows_virtual_machine.vm_config[each.value.virtual_machine_name].id
  publisher            = each.value.publisher
  type                 = each.value.type
  type_handler_version = each.value.type_handler_version
  settings             = each.value.type == "MicrosoftMonitoringAgent" ? jsonencode({ "workspaceId" = "${var.ref_data.log_analytics_workspace[each.value.misc_data].workspace_id}" }) : each.value.settings
  tags                 = merge(var.global_tags, each.value.tags)
  protected_settings   = each.value.type == "MicrosoftMonitoringAgent" ? jsonencode({ "workspaceKey" = "${var.ref_data.log_analytics_workspace[each.value.misc_data].primary_shared_key}" }) : each.value.protected_settings
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}

resource "azurerm_recovery_services_vault" "vm_service_vault" {
  for_each            = var.azurerm_recovery_services_vault_config
  name                = each.key
  location            = var.region
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku
  soft_delete_enabled = each.value.soft_delete_enabled
  tags                = merge(var.global_tags, each.value.tags)
  identity {
    type = "SystemAssigned"
  }
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}

resource "azurerm_backup_policy_vm" "vm_backup_policy" {
  for_each            = var.azurerm_backup_policy_vm_config
  name                = each.key
  resource_group_name = each.value.resource_group_name
  recovery_vault_name = each.value.recovery_vault_name
  timezone            = each.value.timezone
  backup {
    frequency = each.value.backup.frequency
    time      = each.value.backup.time
  }
  retention_daily {
    count = each.value.retention_daily.count
  }
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
  depends_on = [azurerm_recovery_services_vault.vm_service_vault]
}

resource "azurerm_backup_protected_vm" "backup_protected_vm" {
  for_each            = var.azurerm_backup_protected_vm_config
  resource_group_name = each.value.resource_group_name
  recovery_vault_name = each.value.recovery_vault_name
  source_vm_id        = azurerm_windows_virtual_machine.vm_config[each.value.source_vm_name].id
  backup_policy_id    = azurerm_backup_policy_vm.vm_backup_policy[each.value.backup_policy_name].id
  depends_on          = [azurerm_recovery_services_vault.vm_service_vault]
}
