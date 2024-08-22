output "o_static_ip_address" {
  value = {
    spoke1 = module.network_spoke1.o_module_static_ip_address
  }
}

output "o_virtual_network" {
  value = {
    spoke1 = module.network_spoke1.o_virtual_network
  }
}

output "o_subnets" {
  value = {
    spoke1 = module.network_spoke1.o_subnets
  }
}

output "o_private_dns_zone_vnet_link" {
  value = {
    spoke1 = module.private_dns_zone_vnet_link_connectivity.o_private_dns_zone_vnet_link
  }
}