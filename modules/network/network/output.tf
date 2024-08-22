output "o_virtual_network" {
  value = azurerm_virtual_network.virtual_networks
}

output "o_network_vnet_peerings" {
  value = azurerm_virtual_network_peering.vnet_peerings
}

output "o_module_static_ip_address" {
  value = azurerm_public_ip.static_ips
}

output "o_subnets" {
  value = azurerm_subnet.subnets
}