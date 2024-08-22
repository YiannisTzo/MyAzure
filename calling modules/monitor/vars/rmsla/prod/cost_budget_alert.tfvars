subscription_budget_config = {
  MHRA-LZ-PROD-Monthly-001 = {
    is_applicable  = true
    provider_alias = "spoke1-sub"
    amount         = 10000
    time_frequency = "Monthly"

    time_period = {
      start = "2023-03-01T00:00:00Z"
      end   = "2024-12-31T00:00:00Z"
    }

    notifications_config = [
      {
        enabled        = true
        threshold_type = "Actual"
        threshold      = 50
        operator       = "GreaterThanOrEqualTo"
        emails         = []
        contact_roles  = []
        alert_groups   = ["actgrp-mhra-prod-alert-001"]
      }
      , {
        enabled        = true
        threshold_type = "Actual"
        threshold      = 75
        operator       = "GreaterThanOrEqualTo"
        emails         = []
        contact_roles  = []
        alert_groups   = ["actgrp-mhra-prod-alert-001"]
      }
      , {
        enabled        = true
        threshold_type = "Actual"
        threshold      = 100
        operator       = "GreaterThanOrEqualTo"
        emails         = []
        contact_roles  = []
        alert_groups   = ["actgrp-mhra-prod-alert-001"]
      }
    ]
  }

  MHRA-LZ-PROD-Monthly-002 = {
    is_applicable  = true
    provider_alias = "spoke1-sub"
    amount         = 10000
    time_frequency = "Monthly"

    time_period = {
      start = "2023-03-01T00:00:00Z"
      end   = "2024-12-31T00:00:00Z"
    }

    notifications_config = [
      {
        enabled        = true
        threshold_type = "Forecasted"
        threshold      = 50
        operator       = "GreaterThanOrEqualTo"
        emails         = []
        contact_roles  = []
        alert_groups   = ["actgrp-mhra-prod-alert-001"]
      }
      , {
        enabled        = true
        threshold_type = "Forecasted"
        threshold      = 75
        operator       = "GreaterThanOrEqualTo"
        emails         = []
        contact_roles  = []
        alert_groups   = ["actgrp-mhra-prod-alert-001"]
      }
      , {
        enabled        = true
        threshold_type = "Forecasted"
        threshold      = 100
        operator       = "GreaterThanOrEqualTo"
        emails         = []
        contact_roles  = []
        alert_groups   = ["actgrp-mhra-prod-alert-001"]
      }
    ]
  }
}
