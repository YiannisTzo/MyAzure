output "o_private_dns_zone" {
  value = azurerm_private_dns_zone.private_dns_zone
}

output "o_private_dns_zone_vnet_link" {
  value = azurerm_private_dns_zone_virtual_network_link.private_dns_zone_vnet_link
}