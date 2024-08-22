locals {
  subnet_ids_by_keyvault = {
    for kvk, kvv in var.key_vaults : kvk => flatten([
      for vnet, snetlist in kvv.network_acls.subnets_config : [
        for snet in snetlist : var.ref_data.subnet_data[format("%s-%s", vnet, snet)].id
      ]
    ])
  }

  principal_sources = {
    uami = var.ref_data.managed_identity_data
  }
}

data "azurerm_client_config" "current" {
}

resource "azurerm_key_vault" "keyvaults" {
  for_each                        = var.key_vaults
  name                            = each.key
  location                        = var.region
  resource_group_name             = each.value.resource_group_name
  enabled_for_disk_encryption     = each.value.enabled_for_disk_encryption
  enabled_for_deployment          = each.value.enabled_for_deployment
  enabled_for_template_deployment = each.value.enabled_for_template_deployment
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days      = each.value.soft_delete_retention_days
  purge_protection_enabled        = each.value.purge_protection_enabled
  sku_name                        = each.value.sku_name
  public_network_access_enabled   = each.value.public_network_access_enabled
  network_acls {
    bypass                     = each.value.network_acls.bypass
    default_action             = each.value.network_acls.enforce_network_rules ? "Deny" : "Allow"
    ip_rules                   = each.value.network_acls.whitelist_public_ips_or_cidrs
    virtual_network_subnet_ids = lookup(local.subnet_ids_by_keyvault, each.key, [])
  }
  tags = merge(var.global_tags, each.value.tags)

  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}

resource "azurerm_key_vault_access_policy" "kv_access_policy" {
  for_each     = var.access_policies
  key_vault_id = azurerm_key_vault.keyvaults[each.value.key_vault_name].id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id = each.value.object_id != "" ? each.value.object_id : (
  local.principal_sources[each.value.object_id_config.resource_type][each.value.object_id_config.name].principal_id)
  application_id          = each.value.application_id != "" ? each.value.application_id : null
  key_permissions         = each.value.key_permissions
  secret_permissions      = each.value.secret_permissions
  certificate_permissions = each.value.certificate_permissions
  storage_permissions     = each.value.storage_permissions

  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}

