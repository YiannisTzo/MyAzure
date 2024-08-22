# peer virtual networks
resource "azurerm_virtual_network_peering" "vnet_peerings" {
  for_each                     = var.vnet_peering_config
  name                         = each.key
  resource_group_name          = each.value.resource_group_name
  virtual_network_name         = each.value.local_vnet_name
  remote_virtual_network_id    = var.ref_data.remote_vnet_resources[each.value.remote_vnet_name].id
  allow_virtual_network_access = each.value.remote_to_local_access_allow
  allow_forwarded_traffic      = each.value.remote_forward_allow
  allow_gateway_transit        = each.value.remote_gw_access_to_local
  use_remote_gateways          = each.value.local_gw_access_to_remote
  depends_on                   = [azurerm_virtual_network.virtual_networks]
}
