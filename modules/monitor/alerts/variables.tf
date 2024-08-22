variable "monitor_action_group_config" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    resource_group_name = string
    short_name          = string
    enabled             = bool
    tags                = map(string)

    arm_role_receiver = map(object({
      role_id                 = string
      use_common_alert_schema = bool
    }))

    azure_app_push_receiver = map(object({
      email_address = string
    }))

    email_receiver = map(object({
      email_address           = string
      use_common_alert_schema = bool
    }))

    sms_receiver = map(object({
      country_code = string
      phone_number = string
    }))

    voice_receiver = map(object({
      country_code = string
      phone_number = string
    }))
  }))
}

variable "monitor_log_alert_config" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    resource_group_name = string
    scopes              = list(string)
    enabled             = bool
    description         = string
    tags                = map(string)

    action = list(object({
      action_group_name  = string
      webhook_properties = map(string)
    }))

    criteria = object({
      category                   = string
      operation_name             = string
      resource_provider          = string
      resource_type              = string
      target_resource_group_name = string
      target_resource_name       = string
      caller                     = string
      severity_level             = string
      status                     = string
      sub_status                 = string
      recommendation_type        = string
      recommendation_category    = string
      recommendation_impact      = string

      resource_health = object({
        current_status  = string
        previous_status = string
        reason          = string
      })

      service_health = object({
        events    = string
        locations = string
        services  = string
      })
    })
  }))
}

variable "monitor_metric_alert_config" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    resource_group_name = string
    scopes = list(object({
      resource_type = string
      resource_name = string
    }))
    enabled       = bool
    auto_mitigate = bool
    frequency     = string
    severity      = number
    window_size   = string

    description = string

    actions = list(object({
      action_group_name  = string
      webhook_properties = map(string)
    }))

    criteria = list(object({
      metric_namespace = string
      metric_name      = string
      aggregation      = string
      operator         = string
      threshold        = number
      dimension = list(object({
        name     = string
        operator = string
        values   = list(string)
      }))
      skip_metric_validation = bool
    }))

    tags = map(string)
  }))
}

variable "monitor_service_health_alert_config" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    resource_group_name = string
    scopes              = list(string)
    enabled             = bool
    description         = string
    tags                = map(string)

    action = list(object({
      action_group_name  = string
      webhook_properties = map(string)
    }))

    criteria = object({
      category                   = string
      operation_name             = string
      resource_provider          = string
      resource_type              = string
      target_resource_group_name = string
      target_resource_name       = string
      caller                     = string
      severity_level             = string
      status                     = string
      sub_status                 = string
      recommendation_type        = string
      recommendation_category    = string
      recommendation_impact      = string

      resource_health = object({
        current_status  = string
        previous_status = string
        reason          = string
      })

      service_health = object({
        events    = list(string)
        locations = list(string)
        services  = list(string)
      })
    })
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
    app_gw_data   = any
    firewall_data = any
  })
}

variable "subscription_budget_config" {
  type = map(object({
    is_applicable  = bool
    provider_alias = string
    amount         = number
    time_frequency = string

    time_period = object({
      start = string
      end   = string
    })

    notifications_config = list(object({
      enabled        = bool
      threshold_type = string
      threshold      = number
      operator       = string
      alert_groups   = list(string)
      emails         = list(string)
      contact_roles  = list(string)
    }))
  }))

  default = {}
}
