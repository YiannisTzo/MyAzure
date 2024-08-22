output "o_firewalls" {
  value = azurerm_firewall.firewall_resources
}

output "o_firewall_policy" {
  value = azurerm_firewall_policy.firewall_policy
}

output "o_firewall_policy_rcg" {
  value = azurerm_firewall_policy_rule_collection_group.firewall_policy_rcg
}