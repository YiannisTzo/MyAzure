output "o_module_log_analytics_workspaces" {
  value = azurerm_log_analytics_workspace.laws
}

output "o_app_insights" {
  value = azurerm_application_insights.app_insights
}

output "o_monitor_diagnostics" {
  value = azurerm_monitor_diagnostic_setting.monitor_diagnostic_setting
}