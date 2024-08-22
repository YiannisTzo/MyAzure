#Action groups for activity log alerts
resource "azurerm_monitor_action_group" "monitor_action_groups" {
  for_each            = var.monitor_action_group_config
  name                = each.key
  resource_group_name = each.value.resource_group_name
  short_name          = each.value.short_name
  tags                = merge(var.global_tags, each.value.tags)
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }

  dynamic "arm_role_receiver" {
    for_each = (each.value.arm_role_receiver != null ? [0] : [])
    content {
      name                    = each.value.arm_role_receiver.key
      role_id                 = each.value.arm_role_receiver.role_id
      use_common_alert_schema = each.value.arm_role_receiver.use_common_alert_schema
    }
  }

  dynamic "azure_app_push_receiver" {
    for_each = (each.value.azure_app_push_receiver != null ? [0] : [])
    content {
      name          = each.value.azure_app_push_receiver.key
      email_address = each.value.azure_app_push_receiver.key
    }
  }

  dynamic "email_receiver" {
    for_each = each.value.email_receiver
    content {
      name                    = email_receiver.key
      email_address           = email_receiver.value.email_address
      use_common_alert_schema = email_receiver.value.use_common_alert_schema
    }
  }

  dynamic "sms_receiver" {
    for_each = (each.value.sms_receiver != null ? [0] : [])
    content {
      name         = each.value.sms_receiver.key
      country_code = each.value.sms_receiver.key
      phone_number = each.value.sms_receiver.phone_number
    }
  }

  dynamic "voice_receiver" {
    for_each = (each.value.voice_receiver != null ? [0] : [])
    content {
      name         = each.value.voice_receiver.key
      country_code = each.value.voice_receiver.key
      phone_number = each.value.voice_receiver.phone_number
    }
  }
}