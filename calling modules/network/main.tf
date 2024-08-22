locals {
  vnet_by_provider = {
    for ko, vo in distinct([for ki, vi in var.virtual_networks : vi.provider_alias]) : vo => {
      for kii, vii in var.virtual_networks : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }

  subnet_config_by_provider = {
    for ko, vo in distinct([for ki, vi in var.subnet_config : vi.provider_alias]) : vo => [
      for kii, vii in var.subnet_config : vii if vo == vii.provider_alias && vii.is_applicable
    ]
  }

  vnet_peerings_by_provider = {
    for ko, vo in distinct([for ki, vi in var.vnet_peering_config : vi.provider_alias]) : vo => {
      for kii, vii in var.vnet_peering_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }

  static_ips_by_provider = {
    for ko, vo in distinct([for ki, vi in var.static_ip_address_config : vi.provider_alias]) : vo => {
      for kii, vii in var.static_ip_address_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }

  private_dns_zone_vnet_link_config_by_provider = {
    for ko, vo in distinct([for ki, vi in var.private_dns_zone_vnet_link_config : vi.provider_alias]) : vo => {
      for kii, vii in var.private_dns_zone_vnet_link_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }
}

module "network_spoke1" {
  source                   = "../../shared/network/network"
  depends_on               = []
  virtual_networks         = local.vnet_by_provider["spoke1-sub"]
  subnet_config            = local.subnet_config_by_provider["spoke1-sub"]
  static_ip_address_config = local.static_ips_by_provider["spoke1-sub"]
  region                   = var.region
  global_tags              = var.global_tags
  crud_timeouts            = var.crud_timeouts
  vnet_peering_config      = local.vnet_peerings_by_provider["spoke1-sub"]
  ref_data = {
    ddos_resources        = {}
    remote_vnet_resources = merge(data.terraform_remote_state.network_resources.outputs.o_virtual_network.connectivity)
  }
  providers = {
    azurerm = azurerm.spoke1-sub
  }
}

module "network_connectivity_to_spoke1_peering" {
  source                   = "../../shared/network/network"
  depends_on               = [module.network_spoke1]
  virtual_networks         = {}
  subnet_config            = []
  static_ip_address_config = {}
  region                   = var.region
  global_tags              = var.global_tags
  crud_timeouts            = var.crud_timeouts
  vnet_peering_config      = local.vnet_peerings_by_provider["connectivity-sub"]
  ref_data = {
    ddos_resources        = {}
    remote_vnet_resources = module.network_spoke1.o_virtual_network
  }
  providers = {
    azurerm = azurerm.connectivity-sub
  }
}

module "private_dns_zone_vnet_link_connectivity" {
  source                            = "../../shared/network/private_dns_zone"
  private_dns_zone_config           = {}
  private_dns_zone_vnet_link_config = local.private_dns_zone_vnet_link_config_by_provider["connectivity-sub"]
  region                            = var.region
  global_tags                       = var.global_tags
  crud_timeouts                     = var.crud_timeouts
  ref_data = {
    remote_vnet_resources = module.network_spoke1.o_virtual_network
  }
  providers = {
    azurerm = azurerm.connectivity-sub
  }
}
