locals {
  # collect policy assignment name and corresponding policy definition
  subscription_policy_associations = merge(
    {
      for k, v in var.azure_policy_assignment : k => v.policy_definition_id
      }, {
      for k, v in var.azure_custom_policy_assignment : k => var.ref_data["policy_definitions"][v.policy_definition_name]
  })

  # merge all subscription policy assignments together
  subscription_policy_assignments = merge(var.azure_custom_policy_assignment, var.azure_policy_assignment)

  subscription_policy_params = {
    for k, v in local.subscription_policy_assignments : k =>
    merge({
      for k2, v2 in var.ref_data["policy_parameter_values"][k].static_params : v2.name => { value = v2.value }
      }, {
      for k2, v2 in var.ref_data["policy_parameter_values"][k].dynamic_params : v2.name => { value = var.ref_data["all_resources"][v2.resource_type][v2.resource_name][v2.value_attribute_name] }
      }
    )
  }
}

resource "azurerm_subscription_policy_assignment" "subscription_policy_assignment" {
  for_each             = local.subscription_policy_assignments
  name                 = each.key
  subscription_id      = each.value.scope
  policy_definition_id = local.subscription_policy_associations[each.key]
  description          = each.value.description
  display_name         = each.value.display_name
  not_scopes           = each.value.not_scopes
  identity {
    type         = var.identity_type
    identity_ids = [var.ref_data.policy_managed_identity[var.identity_name].id]
  }
  enforce    = each.value.enforcement_mode
  parameters = length(local.subscription_policy_params[each.key]) > 0 ? jsonencode(local.subscription_policy_params[each.key]) : null
  location   = var.location
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}
