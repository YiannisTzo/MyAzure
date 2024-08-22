resource "azurerm_virtual_network_gateway" "expressroute_gateway" {
  for_each            = var.express_route_gateway_config
  name                = each.key
  location            = var.region
  resource_group_name = each.value.resource_group_name

  type = each.value.gateway_type

  active_active = each.value.enable_active_active
  enable_bgp    = each.value.enable_bgp
  sku           = each.value.sku_code

  generation                 = each.value.gateway_generation
  private_ip_address_enabled = each.value.enable_private_ip

  dynamic "ip_configuration" {
    for_each = each.value.ip_config
    content {
      name                          = ip_configuration.key
      private_ip_address_allocation = ip_configuration.value.private_ip_allocation_type
      subnet_id                     = var.ref_data.subnet_data[format("%s-%s", ip_configuration.value.vnet_name, ip_configuration.value.subnet_name)].id
      public_ip_address_id          = var.ref_data.static_ip_data[ip_configuration.value.static_ip_address_name].id
    }
  }

  tags = merge(
    var.global_tags, each.value.tags
  )

  timeouts {
    create = each.value.crud_timeouts.create
    read   = each.value.crud_timeouts.read
    update = each.value.crud_timeouts.update
    delete = each.value.crud_timeouts.delete
  }
}
