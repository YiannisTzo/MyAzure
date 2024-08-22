locals {
  subnet_ids_by_storage_ac = {
    for sk, sv in var.storage_account_config : sk => flatten([
      for vnet, snetlist in sv.network_rules.subnets_config : [
        for snet in snetlist : var.ref_data.subnet_data[format("%s-%s", vnet, snet)].id
      ]
    ])
  }
}

resource "azurerm_storage_account" "storage_accounts" {
  for_each                        = var.storage_account_config
  name                            = each.key
  resource_group_name             = each.value.resource_group_name
  location                        = var.region
  account_tier                    = each.value.account_tier
  account_replication_type        = each.value.account_replication_type
  tags                            = merge(var.global_tags, each.value.tags)
  access_tier                     = each.value.access_tier
  account_kind                    = each.value.account_kind
  is_hns_enabled                  = each.value.hierarchical_namespace_enabled
  public_network_access_enabled   = each.value.public_network_access_enabled
  allow_nested_items_to_be_public = each.value.allow_nested_items_to_be_public

  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
  
  dynamic "azure_files_authentication" {
    for_each = each.value.azure_files_authentication != null ? [each.value.azure_files_authentication] : []
    content {
      directory_type = azure_files_authentication.value.directory_type

      dynamic "active_directory" {
        for_each = azure_files_authentication.value.active_directory != null ? [azure_files_authentication.value.active_directory] : []
        content {
          domain_name         = active_directory.value.domain_name
          domain_guid         = active_directory.value.domain_guid
          domain_sid          = active_directory.value.domain_sid
          storage_sid         = active_directory.value.storage_sid
          forest_name         = active_directory.value.forest_name
          netbios_domain_name = active_directory.value.netbios_domain_name
        }
      }
    }
  }
}

resource "azurerm_storage_account_network_rules" "storage_account_network_rules" {
  for_each                   = var.storage_account_config
  storage_account_id         = azurerm_storage_account.storage_accounts[each.key].id
  default_action             = each.value.network_rules.enforce_network_rules ? "Deny" : "Allow"
  virtual_network_subnet_ids = lookup(local.subnet_ids_by_storage_ac, each.key, [])
  ip_rules                   = each.value.network_rules.whitelist_public_ips_or_cidrs
  bypass                     = each.value.network_rules.bypass_traffic

  dynamic "private_link_access" {
    for_each = (each.value.network_rules.private_link_access_config != null ? each.value.network_rules.private_link_access_config : [])
    content {
      endpoint_resource_id = private_link_access.endpoint_resource_id
      endpoint_tenant_id   = private_link_access.endpoint_tenant_id
    }
  }

  depends_on = [azurerm_storage_account.storage_accounts]

lifecycle {
    ignore_changes = [
      private_link_access, 
      virtual_network_subnet_ids
    ]
  }
}

resource "azurerm_storage_share" "file_shares" {
  for_each             = var.storage_file_share_config
  name                 = each.key
  storage_account_name = azurerm_storage_account.storage_accounts[each.value.storage_account_name].name
  quota                = each.value.quota
  enabled_protocol     = each.value.enabled_protocol
}
