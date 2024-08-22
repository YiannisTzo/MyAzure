# custom policy definition resources
locals {
  # map of policy set to (map of policy id to policy config object)
  # example:
  # { <set name>: {id1:{} id2:{} }}
  __policy_set_policy_definitions = {
    for k, v in var.custom_policy_set_definition_config : k => merge({
      for ik1, iv1 in v.policy_definition_reference_builtin : iv1.policy_definition_id => iv1 #for builtin policies
      }, {
      for ik2, iv2 in v.policy_definition_reference_custom : var.ref_data["policy_definitions"][iv2.policy_definition_name] => iv2 #for custom policies
    })
  }

  # convert __policy_set_policy_definitions to map of list:
  # example
  # { <set name>: [{policy_definition_id: id1 policy_defn_ref_config: {}}, {policy_definition_id: id2 policy_defn_ref_config: {}}] }
  policy_set_policy_definitions = {
    for k, v in local.__policy_set_policy_definitions : k => [
      for ik, iv in v : {
        policy_definition_id   = ik
        policy_defn_ref_config = iv #object with id and parameter_values_mapping
      }
    ]
  }
}

resource "azurerm_policy_set_definition" "custom_set_definition" { #policy initiative
  for_each            = var.custom_policy_set_definition_config
  name                = each.key
  policy_type         = each.value.policy_type
  display_name        = each.value.display_name
  description         = each.value.description
  management_group_id = each.value.management_group_name != "" ? each.value.management_group_name : null
  metadata            = each.value.metadata
  depends_on          = [azurerm_policy_definition.custom_policy_definition, azurerm_subscription_policy_assignment.subscription_policy_assignment]
  parameters          = each.value.parameters
  dynamic "policy_definition_reference" {
    for_each = local.policy_set_policy_definitions[each.key]
    content {
      policy_definition_id = policy_definition_reference.value.policy_definition_id
      parameter_values     = policy_definition_reference.value.policy_defn_ref_config.parameter_values_mapping
    }
  }
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}