resource "azurerm_route_table" "route_tables" {
  for_each                      = var.route_tables_config
  name                          = each.key
  location                      = var.region
  resource_group_name           = each.value.resource_group_name
  bgp_route_propagation_enabled = each.value.bgp_route_propagation_enabled

  # add routing rules now
  dynamic "route" {
    for_each = [for v in each.value.routing_rules : v if v.is_applicable]
    content {
      name           = route.value.rule_name
      address_prefix = route.value.cidr
      next_hop_type  = route.value.route_target_type
      next_hop_in_ip_address = route.value.route_target_type == "VnetLocal" ? null : (
        route.value.route_target_address != ""
        ? route.value.route_target_address
        : (var.ref_data.vappliances[route.value.route_target_name].ip_configuration[0].private_ip_address)
      )
    }
  }

  tags = merge(var.global_tags, each.value.tags)
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
    lifecycle {
    ignore_changes = all 
  }
}

resource "azurerm_subnet_route_table_association" "route_table_subnets" {
  for_each       = { for k, v in var.route_table_subnets_config : k => v }
  subnet_id      = var.ref_data.subnet_data[format("%s-%s", each.value.vnet_name, each.value.subnet_name)].id
  route_table_id = azurerm_route_table.route_tables[each.value.route_table_name].id
  depends_on     = [azurerm_route_table.route_tables]

  lifecycle {
    ignore_changes = []
  }
}