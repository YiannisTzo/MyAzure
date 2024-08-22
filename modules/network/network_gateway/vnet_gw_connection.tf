resource "azurerm_virtual_network_gateway_connection" "site_to_site_vnet_gw_connections" {
  for_each            = var.site_to_site_gateway_connection_config
  name                = each.key
  resource_group_name = each.value.resource_group_name
  location            = var.region
  depends_on = [
    azurerm_virtual_network_gateway.expressroute_gateway
  ]

  type                       = each.value.connection_type
  virtual_network_gateway_id = azurerm_virtual_network_gateway.expressroute_gateway[each.value.vnet_gw_name].id
  authorization_key          = each.value.authorization_key == "" ? null : var.ref_data.ergw_conn_auth_keys[each.value.authorization_key]
  # TODO if the ERC is provisioned using terraform, add support to lookup the id
  express_route_circuit_id = each.value.express_route_circuit_id == "" ? null : each.value.express_route_circuit_id

  shared_key = each.value.shared_key != "" ? each.value.shared_key : null

  tags = merge(
    var.global_tags, each.value.tags
  )

  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }

  dpd_timeout_seconds = each.value.dpd_timeout_seconds
  enable_bgp          = each.value.enable_bgp

  dynamic "ipsec_policy" {
    for_each = each.value.ipsec_policy_config.is_applicable ? [0] : []
    content {
      dh_group         = each.value.ipsec_policy_config.dh_group
      ike_encryption   = each.value.ipsec_policy_config.ike_encryption
      ike_integrity    = each.value.ipsec_policy_config.ike_integrity
      ipsec_encryption = each.value.ipsec_policy_config.ipsec_encryption
      ipsec_integrity  = each.value.ipsec_policy_config.ipsec_integrity
      pfs_group        = each.value.ipsec_policy_config.pfs_group
      sa_datasize      = each.value.ipsec_policy_config.sa_datasize
      sa_lifetime      = each.value.ipsec_policy_config.sa_lifetime
    }
  }
  connection_protocol = each.value.connection_protocol

  #custom bgp addresses block is suported in 3.6.0 version of terraform-provider-azurerm

  dynamic "custom_bgp_addresses" {
    for_each = each.value.custom_bgp_addresses.is_applicable ? [0] : []
    content {
      primary   = each.value.custom_bgp_addresses.primary_vnet_gw_ip_address
      secondary = each.value.custom_bgp_addresses.secondary_vnet_gw_ip_address
    }
  }

  local_azure_ip_address_enabled = each.value.local_azure_ip_address_enabled

  lifecycle {
    ignore_changes = [
      shared_key
    ]
  }
}
