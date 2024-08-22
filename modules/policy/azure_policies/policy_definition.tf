# custom policy definition resources
resource "azurerm_policy_definition" "custom_policy_definition" {
  for_each            = var.azure_custom_policy_definition
  name                = each.key
  policy_type         = each.value.policy_type
  mode                = each.value.mode
  display_name        = each.value.display_name
  description         = each.value.description
  management_group_id = each.value.management_group_name != "" ? each.value.management_group_name : null
  metadata            = each.value.metadata
  policy_rule         = each.value.policy_rule
  parameters          = each.value.parameters

  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}
