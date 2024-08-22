output "o_nsg" {
  value = {
    spoke1 = module.nsg_spoke1.o_nsg
  }
}

output "o_routing_tables" {
  value = {
    spoke1 = module.network_routes_spoke1.o_module_routing_tables
  }
}

output "o_app_gw" {
  value = {
    spoke1 = module.azurerm_application_gateway.o_app_gw
  }
}