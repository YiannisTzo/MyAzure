locals {
  monitor_diagnostic_config_by_provider = {
    for ko, vo in distinct([for ki, vi in var.monitor_diagnostic_config : vi.provider_alias]) : vo => {
      for kii, vii in var.monitor_diagnostic_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }

  action_groups_config_by_provider = {
    for ko, vo in distinct([for ki, vi in var.monitor_action_group_config : vi.provider_alias]) : vo => {
      for kii, vii in var.monitor_action_group_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }

  subscription_budget_config_by_provider = {
    for ko, vo in distinct([for ki, vi in var.subscription_budget_config : vi.provider_alias]) : vo => {
      for kii, vii in var.subscription_budget_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }

  appinsights_by_provider = {
    for ko, vo in distinct([for ki, vi in var.app_insights_config : vi.provider_alias]) : vo => {
      for kii, vii in var.app_insights_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }
}

module "monitoring_resources_management" {
  source                    = "../../shared/monitor/monitor"
  log_analytics_workspaces  = {}
  app_insights              = local.appinsights_by_provider["spoke1-sub"]
  monitor_diagnostic_config = local.monitor_diagnostic_config_by_provider["spoke1-sub"]
  region                    = var.region
  global_tags               = var.global_tags
  crud_timeouts             = var.crud_timeouts

  providers = {
    azurerm = azurerm.spoke1-sub
  }

  ref_data = {
    nsg_data       = {}
    stg_acc_data   = merge(data.terraform_remote_state.storage_resources.outputs.o_storage_accounts, data.terraform_remote_state.hub_storage_resources.outputs.o_storage_accounts)
    firewall_data  = {}
    key_vault_data = data.terraform_remote_state.security_resources.outputs.o_key_vaults.spoke1
    app_gw_data    = data.terraform_remote_state.network_routing_resources.outputs.o_app_gw.spoke1
    laws_data      = data.terraform_remote_state.monitoring_resources.outputs.o_log_analytics_workspaces.management
    public_ip_data = data.terraform_remote_state.network_resources.outputs.o_static_ip_address.spoke1
  }
}

module "monitoring_alerts_spoke1" {
  source                              = "../../shared/monitor/alerts"
  monitor_action_group_config         = local.action_groups_config_by_provider["spoke1-sub"]
  subscription_budget_config          = local.subscription_budget_config_by_provider["spoke1-sub"]
  monitor_metric_alert_config         = {}
  monitor_service_health_alert_config = {}
  monitor_log_alert_config            = {}
  region                              = var.region
  global_tags                         = var.global_tags
  crud_timeouts                       = var.crud_timeouts

  providers = {
    azurerm = azurerm.spoke1-sub
  }

  ref_data = {
    app_gw_data   = {}
    firewall_data = {}
  }
}
