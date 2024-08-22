locals {
  id_by_target_resource_type = {
    # For any other resource type for which monitor diagnostic setting has to be enabled,
    # please add an entry here.    
    key_vault  = lookup(var.ref_data, "key_vault_data", {})
    nsg        = lookup(var.ref_data, "nsg_data", {})
    firewall   = lookup(var.ref_data, "firewall_data", {})
    pip        = lookup(var.ref_data, "public_ip_data", {})
    appgw      = lookup(var.ref_data, "app_gw_data", {})
    storage_ac = lookup(var.ref_data, "stg_acc_data", {})
    laws       = lookup(var.ref_data, "laws_data", {})
    app_ins    = azurerm_application_insights.app_insights
  }
}

resource "azurerm_monitor_diagnostic_setting" "monitor_diagnostic_setting" {
  for_each   = var.monitor_diagnostic_config
  depends_on = [azurerm_application_insights.app_insights]
  name       = each.key
  target_resource_id = format("%s%s"
    , local.id_by_target_resource_type[each.value.target_resource_type][each.value.target_resource_name].id
  , each.value.target_resource_subresource)

  storage_account_id             = var.ref_data.stg_acc_data[each.value.storage_account_name].id
  log_analytics_workspace_id     = var.ref_data.laws_data[each.value.log_analytics_workspace_name].id
  eventhub_name                  = each.value.eventhub_name != "" ? each.value.eventhub_name : null
  eventhub_authorization_rule_id = each.value.eventhub_authorization_rule_id != "" ? each.value.eventhub_authorization_rule_id : null
  log_analytics_destination_type = each.value.log_analytics_destination_type != "" ? each.value.log_analytics_destination_type : null
  dynamic "log" {
    for_each = each.value.log
    content {
      category = log.value.category
      enabled  = log.value.enabled
      retention_policy {
        enabled = log.value.retention_policy.enabled
        days    = log.value.retention_policy.days
      }
    }
  }
  dynamic "metric" {
    for_each = each.value.metric
    content {
      category = metric.value.category
      enabled  = metric.value.enabled
      retention_policy {
        enabled = metric.value.retention_policy.enabled
        days    = metric.value.retention_policy.days != null ? metric.value.retention_policy.days : null
      }
    }
  }
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}
