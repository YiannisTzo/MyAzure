resource "azurerm_consumption_budget_subscription" "subscription_budgets" {
  for_each        = var.subscription_budget_config
  name            = each.key
  subscription_id = data.azurerm_subscription.current.id

  amount     = each.value.amount
  time_grain = each.value.time_frequency

  time_period {
    start_date = each.value.time_period.start
    end_date   = each.value.time_period.end
  }

  dynamic "notification" {
    for_each = each.value.notifications_config
    content {
      enabled        = notification.value.enabled
      threshold      = notification.value.threshold
      threshold_type = notification.value.threshold_type
      operator       = notification.value.operator
      contact_emails = notification.value.emails
      contact_roles  = notification.value.contact_roles

      contact_groups = [
        for ag in notification.value.alert_groups : azurerm_monitor_action_group.monitor_action_groups[ag].id
      ]
    }
  }
}

data "azurerm_subscription" "current" {}
