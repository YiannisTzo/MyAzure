#This resource creates an Activity log alert or Service health alert by enabling/disabling some parameters.
resource "azurerm_monitor_activity_log_alert" "svc_health_alerts" {
  for_each            = var.monitor_service_health_alert_config
  name                = each.key
  depends_on          = [azurerm_monitor_action_group.monitor_action_groups]
  resource_group_name = each.value.resource_group_name
  scopes              = each.value.scopes
  description         = each.value.description
  tags                = merge(var.global_tags, each.value.tags)
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }

  dynamic "action" {
    for_each = each.value.action
    content {
      action_group_id    = azurerm_monitor_action_group.monitor_action_groups[action.value.action_group_name].id
      webhook_properties = action.value.webhook_properties
    }
  }

  dynamic "criteria" {
    for_each = (each.value.criteria != null ? [0] : [])
    content {
      category                = each.value.criteria.category
      operation_name          = each.value.criteria.operation_name != "" ? each.value.criteria.operation_name : null
      resource_provider       = each.value.criteria.resource_provider != "" ? each.value.criteria.resource_provider : null
      resource_type           = each.value.criteria.resource_type != "" ? each.value.criteria.resource_type : null
      resource_group          = each.value.criteria.target_resource_group_name != "" ? each.value.criteria.target_resource_group_name : null
      resource_id             = each.value.criteria.target_resource_name != "" ? each.value.criteria.target_resource_name : null
      caller                  = each.value.criteria.caller != "" ? each.value.criteria.caller : null
      level                   = each.value.criteria.severity_level != "" ? each.value.criteria.severity_level : null
      status                  = each.value.criteria.status != "" ? each.value.criteria.status : null
      sub_status              = each.value.criteria.sub_status != "" ? each.value.criteria.sub_status : null
      recommendation_type     = each.value.criteria.recommendation_type != "" ? each.value.criteria.recommendation_type : null
      recommendation_category = each.value.criteria.recommendation_category != "" ? each.value.criteria.recommendation_category : null
      recommendation_impact   = each.value.criteria.recommendation_impact != "" ? each.value.criteria.recommendation_impact : null

      dynamic "resource_health" {
        for_each = (each.value.criteria.resource_health != null ? [0] : [])
        content {
          current  = each.value.criteria.resource_health.current_status != "" ? each.value.criteria.resource_health.current_status : null
          previous = each.value.criteria.resource_health.previous_status != "" ? each.value.criteria.resource_health.previous_status : null
          reason   = each.value.criteria.resource_health.reason != "" ? each.value.criteria.resource_health.reason : null
        }
      }

      dynamic "service_health" {
        for_each = (each.value.criteria.service_health != null ? [0] : [])
        content {
          events    = each.value.criteria.service_health.events != "" ? each.value.criteria.service_health.events : null
          locations = each.value.criteria.service_health.locations != "" ? each.value.criteria.service_health.locations : null
          services  = each.value.criteria.service_health.services != "" ? each.value.criteria.service_health.services : null
        }
      }
    }
  }
}