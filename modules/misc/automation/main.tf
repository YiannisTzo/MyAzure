locals {
  id_by_target_resource_type = {
    log_analytics_workspace = var.ref_data.log_analytics_workspace
  }
}

# Create Azure Automation Account
resource "azurerm_automation_account" "automation_acc" {
  for_each                      = var.automation_accounts_config
  name                          = each.key
  location                      = var.region
  resource_group_name           = each.value.resource_group_name
  sku_name                      = each.value.sku_name
  public_network_access_enabled = each.value.public_network_access_enabled
  tags                          = merge(var.global_tags, each.value.tags)
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}

## Link Automation account to Log Analytics Workspace
resource "azurerm_log_analytics_linked_service" "laws_linked_service" {
  for_each            = var.laws_linked_service_config
  resource_group_name = each.value.resource_group_name
  workspace_id        = local.id_by_target_resource_type.log_analytics_workspace[each.value.workspace_name].id
  read_access_id      = azurerm_automation_account.automation_acc[each.value.automation_acc_name].id
}