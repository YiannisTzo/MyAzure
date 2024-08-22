# Monitor module
# Application insights details
monitor_diagnostic_config = {
  mondiag-mhra-mgmt-uks-stac-001 = {
    provider_alias                 = "spoke1-sub"
    is_applicable                  = true
    target_resource_type           = "storage_ac"
    target_resource_name           = "stmhradevuksrms01"
    target_resource_subresource    = "/blobServices/default"
    storage_account_name           = "stmhracnctuksvmdiag01"
    target_resource_id             = ""
    log_analytics_workspace_name   = "lw-mhra-mgmt-uks-01"
    eventhub_name                  = ""
    eventhub_authorization_rule_id = ""
    log_analytics_destination_type = ""
    log = [
      {
        category = "StorageDelete"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
      , {
        category = "StorageRead"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
      , {
        category = "StorageWrite"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
    ]
    metric = [
      {
        category = "Capacity"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
      , {
        category = "Transaction"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
    ]
  }

  mondiag-mhra-mgmt-uks-stac-002 = {
    provider_alias                 = "spoke1-sub"
    is_applicable                  = true
    target_resource_type           = "storage_ac"
    target_resource_name           = "stmhradevuksla01"
    target_resource_subresource    = "/blobServices/default"
    storage_account_name           = "stmhracnctuksvmdiag01"
    target_resource_id             = ""
    log_analytics_workspace_name   = "lw-mhra-mgmt-uks-01"
    eventhub_name                  = ""
    eventhub_authorization_rule_id = ""
    log_analytics_destination_type = ""
    log = [
      {
        category = "StorageDelete"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
      , {
        category = "StorageRead"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
      , {
        category = "StorageWrite"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
    ]
    metric = [
      {
        category = "Capacity"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
      , {
        category = "Transaction"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
    ]
  }

  mondiag-mhra-mgmt-uks-stac-003 = {
    provider_alias                 = "spoke1-sub"
    is_applicable                  = true
    target_resource_type           = "storage_ac"
    target_resource_name           = "stmhradevuksla02"
    target_resource_subresource    = "/blobServices/default"
    storage_account_name           = "stmhracnctuksvmdiag01"
    target_resource_id             = ""
    log_analytics_workspace_name   = "lw-mhra-mgmt-uks-01"
    eventhub_name                  = ""
    eventhub_authorization_rule_id = ""
    log_analytics_destination_type = ""
    log = [
      {
        category = "StorageDelete"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
      , {
        category = "StorageRead"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
      , {
        category = "StorageWrite"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
    ]
    metric = [
      {
        category = "Capacity"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
      , {
        category = "Transaction"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
    ]
  }

  mondiag-mhra-mgmt-uks-pip-001 = {
    provider_alias                 = "spoke1-sub"
    is_applicable                  = true
    target_resource_type           = "pip"
    target_resource_name           = "pip-agw-mhra-dev-uks-h1s01"
    target_resource_subresource    = ""
    storage_account_name           = "stmhracnctuksvmdiag01"
    target_resource_id             = ""
    log_analytics_workspace_name   = "lw-mhra-mgmt-uks-01"
    eventhub_name                  = ""
    eventhub_authorization_rule_id = ""
    log_analytics_destination_type = ""
    log = [
      {
        category = "DDoSMitigationFlowLogs"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
      , {
        category = "DDoSMitigationReports"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
      , {
        category = "DDoSProtectionNotifications"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
    ]
    metric = [
      {
        category = "AllMetrics"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
    ]
  }

  mondiag-mhra-mgmt-uks-agw-001 = {
    provider_alias                 = "spoke1-sub"
    is_applicable                  = true
    target_resource_type           = "appgw"
    target_resource_name           = "agw-mhra-dev-uks-01"
    target_resource_subresource    = ""
    storage_account_name           = "stmhracnctuksvmdiag01"
    target_resource_id             = ""
    log_analytics_workspace_name   = "lw-mhra-mgmt-uks-01"
    eventhub_name                  = ""
    eventhub_authorization_rule_id = ""
    log_analytics_destination_type = ""
    log = [
      {
        category = "ApplicationGatewayAccessLog"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
      , {
        category = "ApplicationGatewayFirewallLog"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
      , {
        category = "ApplicationGatewayPerformanceLog"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
    ]
    metric = [
      {
        category = "AllMetrics"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
    ]
  }

  mondiag-mhra-mgmt-uks-kv-001 = {
    provider_alias                 = "spoke1-sub"
    is_applicable                  = true
    target_resource_type           = "key_vault"
    target_resource_name           = "kvrms01devuks"
    target_resource_subresource    = ""
    storage_account_name           = "stmhracnctuksvmdiag01"
    target_resource_id             = ""
    log_analytics_workspace_name   = "lw-mhra-mgmt-uks-01"
    eventhub_name                  = ""
    eventhub_authorization_rule_id = ""
    log_analytics_destination_type = ""
    log = [
      {
        category = "AuditEvent"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
      , {
        category = "AzurePolicyEvaluationDetails"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
    ]
    metric = [
      {
        category = "AllMetrics"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
    ]
  }

  mondiag-mhra-mgmt-uks-kv-002 = {
    provider_alias                 = "spoke1-sub"
    is_applicable                  = true
    target_resource_type           = "key_vault"
    target_resource_name           = "kvla01devuks"
    target_resource_subresource    = ""
    storage_account_name           = "stmhracnctuksvmdiag01"
    target_resource_id             = ""
    log_analytics_workspace_name   = "lw-mhra-mgmt-uks-01"
    eventhub_name                  = ""
    eventhub_authorization_rule_id = ""
    log_analytics_destination_type = ""
    log = [
      {
        category = "AuditEvent"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
      , {
        category = "AzurePolicyEvaluationDetails"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
    ]
    metric = [
      {
        category = "AllMetrics"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
    ]
  }

  mondiag-mhra-mgmt-uks-kv-003 = {
    provider_alias                 = "spoke1-sub"
    is_applicable                  = true
    target_resource_type           = "key_vault"
    target_resource_name           = "kvappgw01devuks"
    target_resource_subresource    = ""
    storage_account_name           = "stmhracnctuksvmdiag01"
    target_resource_id             = ""
    log_analytics_workspace_name   = "lw-mhra-mgmt-uks-01"
    eventhub_name                  = ""
    eventhub_authorization_rule_id = ""
    log_analytics_destination_type = ""
    log = [
      {
        category = "AuditEvent"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
      , {
        category = "AzurePolicyEvaluationDetails"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
    ]
    metric = [
      {
        category = "AllMetrics"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
    ]
  }

  mondiag-mhra-mgmt-uks-stac-004 = {
    provider_alias                 = "spoke1-sub"
    is_applicable                  = true
    target_resource_type           = "storage_ac"
    target_resource_name           = "stmhradevuksrms02"
    target_resource_subresource    = "/blobServices/default"
    storage_account_name           = "stmhracnctuksvmdiag01"
    target_resource_id             = ""
    log_analytics_workspace_name   = "lw-mhra-mgmt-uks-01"
    eventhub_name                  = ""
    eventhub_authorization_rule_id = ""
    log_analytics_destination_type = ""
    log = [
      {
        category = "StorageDelete"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
      , {
        category = "StorageRead"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
      , {
        category = "StorageWrite"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
    ]
    metric = [
      {
        category = "Capacity"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
      , {
        category = "Transaction"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
    ]
  }

  mondiag-mhra-mgmt-uks-appi-001 = {
    provider_alias                 = "spoke1-sub"
    is_applicable                  = true
    target_resource_type           = "app_ins"
    target_resource_name           = "appi-mhra-dev-uks-001"
    target_resource_subresource    = ""
    storage_account_name           = "stmhracnctuksvmdiag01"
    target_resource_id             = ""
    log_analytics_workspace_name   = "lw-mhra-mgmt-uks-01"
    eventhub_name                  = ""
    eventhub_authorization_rule_id = ""
    log_analytics_destination_type = ""
    log = [
      {
        category = "AppAvailabilityResults"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
      , {
        category = "AppBrowserTimings"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
      , {
        category = "AppDependencies"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
      , {
        category = "AppEvents"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
      , {
        category = "AppExceptions"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
      , {
        category = "AppPageViews"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
      , {
        category = "AppRequests"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
      , {
        category = "AppTraces"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
      , {
        category = "AppMetrics"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
      , {
        category = "AppPerformanceCounters"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
      , {
        category = "AppSystemEvents"
        enabled  = true
        retention_policy = {
          enabled = true
          days    = 365
        }
      }
    ]
    metric = [
      {
        category = "AllMetrics"
        enabled  = false
        retention_policy = {
          enabled = false
          days    = 0
        }
      }
    ]
  }
}

app_insights_config = {
  appi-mhra-dev-uks-001 = {
    provider_alias                              = "spoke1-sub"
    is_applicable                               = true
    resource_group_name                         = "rg-mhra-dev-uks-monitoring"
    log_analytics_workspace_name                = "lw-mhra-mgmt-uks-01"
    application_type                            = "web"
    data_volume_daily_limit                     = 1
    data_volume_daily_limit_breach_notificaiton = true
    data_retention_days                         = 90
    data_sampling_percentage                    = 25
    disable_ip_masking                          = false
    local_authentication_disabled               = false
    tags = {
    }
  }
}
