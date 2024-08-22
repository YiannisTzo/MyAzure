locals {
  resources_by_type = {
    firewall = var.ref_data.firewall_data
  }
}

resource "azurerm_monitor_metric_alert" "metric_alerts" {
  for_each            = var.monitor_metric_alert_config
  name                = each.key
  depends_on          = [azurerm_monitor_action_group.monitor_action_groups]
  resource_group_name = each.value.resource_group_name
  enabled             = each.value.enabled
  auto_mitigate       = each.value.auto_mitigate
  frequency           = each.value.frequency
  severity            = each.value.severity
  window_size         = each.value.window_size
  description         = each.value.description

  scopes = [
    for scope in each.value.scopes : local.resources_by_type[scope.resource_type][scope.resource_name].id
  ]

  dynamic "criteria" {
    for_each = each.value.criteria
    content {
      skip_metric_validation = criteria.value.skip_metric_validation
      metric_namespace       = criteria.value.metric_namespace
      metric_name            = criteria.value.metric_name
      aggregation            = criteria.value.aggregation
      operator               = criteria.value.operator
      threshold              = criteria.value.threshold

      dynamic "dimension" {
        for_each = criteria.value.dimension
        content {
          name     = dimension.value.name
          operator = dimension.value.operator
          values   = dimension.value.values
        }
      }
    }
  }

  dynamic "action" {
    for_each = each.value.actions
    content {
      action_group_id    = azurerm_monitor_action_group.monitor_action_groups[action.value.action_group_name].id
      webhook_properties = action.value.webhook_properties
    }
  }
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }

  tags = merge(var.global_tags, each.value.tags)
}