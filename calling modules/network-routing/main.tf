locals {
  nsg_config_by_provider = {
    for ko, vo in distinct([for ki, vi in var.nsg_config : vi.provider_alias]) : vo => {
      for kii, vii in var.nsg_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }

  nsg_subnet_association_config_by_provider = {
    for ko, vo in distinct([for ki, vi in var.nsg_subnet_association_config : vi.provider_alias]) : vo => [
      for kii, vii in var.nsg_subnet_association_config : vii if vo == vii.provider_alias && vii.is_applicable
    ]
  }

  route_tables_by_provider = {
    for ko, vo in distinct([for ki, vi in var.route_tables_config : vi.provider_alias]) : vo => {
      for kii, vii in var.route_tables_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }

  route_tables_subnets_by_provider = {
    for ko, vo in distinct([for ki, vi in var.route_table_subnets_config : vi.provider_alias]) : vo => [
      for kii, vii in var.route_table_subnets_config : vii if vo == vii.provider_alias && vii.is_applicable
    ]
  }

  azurerm_application_gateway_config_by_provider = {
    for ko, vo in distinct([for ki, vi in var.azurerm_application_gateway_config : vi.provider_alias]) : vo => {
      for kii, vii in var.azurerm_application_gateway_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }
}

module "nsg_spoke1" {
  source                        = "../../shared/network-routing/network-security-group"
  nsg_config                    = local.nsg_config_by_provider["spoke1-sub"]
  nsg_subnet_association_config = local.nsg_subnet_association_config_by_provider["spoke1-sub"]
  region                        = var.region
  global_tags                   = var.global_tags
  crud_timeouts                 = var.crud_timeouts
  providers = {
    azurerm = azurerm.spoke1-sub
  }

  ref_data = {
    subnet_data = data.terraform_remote_state.network_resources.outputs.o_subnets.spoke1
  }
}

module "network_routes_spoke1" {
  source                     = "../../shared/network-routing/routing-table"
  route_tables_config        = local.route_tables_by_provider["spoke1-sub"]
  route_table_subnets_config = local.route_tables_subnets_by_provider["spoke1-sub"]
  region                     = var.region
  global_tags                = var.global_tags
  crud_timeouts              = var.crud_timeouts
  ref_data = {
    subnet_data = data.terraform_remote_state.network_resources.outputs.o_subnets.spoke1
    vappliances = data.terraform_remote_state.hub_network_routing_resources.outputs.o_firewalls.connectivity
  }

  providers = {
    azurerm = azurerm.spoke1-sub
  }
}

module "azurerm_application_gateway" {
  source                             = "../../shared/network-routing/app-gateway"
  azurerm_application_gateway_config = lookup(local.azurerm_application_gateway_config_by_provider, "spoke1-sub", {})
  azure_app_gway_waf_configuration    = try(var.azure_app_gway_waf_configuration, {})
  region                             = var.region
  global_tags                        = var.global_tags
  crud_timeouts                      = var.crud_timeouts
  providers = {
    azurerm = azurerm.spoke1-sub
  }

  ref_data = {
    subnet_data     = data.terraform_remote_state.network_resources.outputs.o_subnets.spoke1
    static_ip_data  = data.terraform_remote_state.network_resources.outputs.o_static_ip_address.spoke1
    managed_id_data = data.terraform_remote_state.identity_resources.outputs.o_managed_identity.spoke1
  }
}