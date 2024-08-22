resource "azurerm_log_analytics_workspace" "laws" {
  for_each            = var.log_analytics_workspaces
  name                = each.key
  location            = var.region
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.billing_plan
  retention_in_days   = each.value.retention_in_days
  daily_quota_gb      = each.value.daily_quota_gb
  tags                = merge(var.global_tags, each.value.tags)
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}

resource "azurerm_application_insights" "app_insights" {
  for_each            = var.app_insights
  name                = each.key
  location            = var.region
  resource_group_name = each.value.resource_group_name
  tags                = merge(var.global_tags, each.value.tags)
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
  depends_on = [azurerm_log_analytics_workspace.laws]

  workspace_id                          = var.ref_data.laws_data[each.value.log_analytics_workspace_name].id
  application_type                      = each.value.application_type
  daily_data_cap_in_gb                  = each.value.data_volume_daily_limit
  daily_data_cap_notifications_disabled = each.value.data_volume_daily_limit_breach_notificaiton
  retention_in_days                     = each.value.data_retention_days
  sampling_percentage                   = each.value.data_sampling_percentage
  disable_ip_masking                    = each.value.disable_ip_masking
  local_authentication_disabled         = each.value.local_authentication_disabled
}

resource "azurerm_log_analytics_solution" "la_solution" {
  for_each              = var.log_analytics_solutions_config
  solution_name         = each.value.solution_name
  location              = var.region
  resource_group_name   = each.value.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.laws[each.value.log_analytics_workspace_name].id
  workspace_name        = azurerm_log_analytics_workspace.laws[each.value.log_analytics_workspace_name].name

  plan {
    publisher = each.value.plan_specs.publisher_name
    product   = each.value.plan_specs.product_id
  }
}