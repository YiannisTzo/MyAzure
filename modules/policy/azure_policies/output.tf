output "o_az_policy_assignments" {
  value = azurerm_subscription_policy_assignment.subscription_policy_assignment
}

output "o_custom_policy_definition" {
  value = { for k, v in azurerm_policy_definition.custom_policy_definition : v.name => v.id }
}

output "o_custom_policyset_definition" {
  value = { for k, v in azurerm_policy_set_definition.custom_set_definition : v.name => v.id }
}