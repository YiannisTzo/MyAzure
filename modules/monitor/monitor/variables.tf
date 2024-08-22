variable "log_analytics_workspaces" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    resource_group_name = string
    billing_plan        = string
    retention_in_days   = number
    daily_quota_gb      = number
    tags                = map(string)
  }))
}

variable "app_insights" {
  type = map(object({
    provider_alias                              = string
    is_applicable                               = bool
    resource_group_name                         = string
    tags                                        = map(string)
    log_analytics_workspace_name                = string
    application_type                            = string
    data_volume_daily_limit                     = number
    data_volume_daily_limit_breach_notificaiton = bool
    data_retention_days                         = number
    data_sampling_percentage                    = number
    disable_ip_masking                          = bool
    local_authentication_disabled               = bool
  }))
}

variable "region" {
  type = string
}

variable "global_tags" {
  type = map(string)
}

variable "crud_timeouts" {
  type = map(string)
}

variable "ref_data" {
  type = object({
    nsg_data       = any
    stg_acc_data   = any
    firewall_data  = any
    key_vault_data = any
    laws_data      = any
    app_gw_data    = any
    public_ip_data = any
  })
}

variable "monitor_diagnostic_config" {
  type = map(object({
    provider_alias                 = string
    is_applicable                  = bool
    target_resource_type           = string
    target_resource_name           = string
    target_resource_subresource    = string
    storage_account_name           = string
    target_resource_id             = string
    log_analytics_workspace_name   = string
    eventhub_name                  = string
    eventhub_authorization_rule_id = string
    log_analytics_destination_type = string

    log = list(object({
      category = string
      enabled  = bool
      retention_policy = object({
        enabled = bool
        days    = number
      })
    }))

    metric = list(object({
      category = string
      enabled  = bool
      retention_policy = object({
        enabled = bool
        days    = number
      })
    }))
  }))
}

variable "log_analytics_solutions_config" {
  type = map(object({
    provider_alias               = string
    is_applicable                = bool
    resource_group_name          = string
    solution_name                = string
    log_analytics_workspace_name = string
    plan_specs = object({
      publisher_name = string
      product_id     = string
    })
  }))

  default = {}
}
