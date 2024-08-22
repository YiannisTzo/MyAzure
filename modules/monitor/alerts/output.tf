output "o_monitor_service_health_alert" {
  value = azurerm_monitor_activity_log_alert.svc_health_alerts
}

output "o_monitor_action_group" {
  value = azurerm_monitor_action_group.monitor_action_groups
}

output "o_monitor_metric_alert" {
  value = azurerm_monitor_metric_alert.metric_alerts
}

output "o_monitor_activity_log_alert" {
  value = azurerm_monitor_activity_log_alert.activity_log_alerts
}