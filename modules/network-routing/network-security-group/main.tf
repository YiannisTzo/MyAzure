resource "azurerm_network_security_group" "nsg_resource" {
  for_each            = var.nsg_config
  name                = each.key
  location            = var.region
  resource_group_name = each.value.resource_group_name
  dynamic "security_rule" {
    for_each = each.value.security_rule
    content {
      name                    = security_rule.value.name
      priority                = security_rule.value.priority
      direction               = security_rule.value.direction
      access                  = security_rule.value.access
      protocol                = security_rule.value.protocol
      source_port_ranges      = (length(split(",", security_rule.value.source_port_range)) == 1 ? [] : split(",", security_rule.value.source_port_range))
      destination_port_ranges = (length(split(",", security_rule.value.destination_port_range)) == 1 ? [] : split(",", security_rule.value.destination_port_range))
      source_port_range       = (length(split(",", security_rule.value.source_port_range)) == 1 ? security_rule.value.source_port_range : "")
      destination_port_range  = (length(split(",", security_rule.value.destination_port_range)) == 1 ? security_rule.value.destination_port_range : "")

      source_address_prefix = contains(["*", "VirtualNetwork", "AzureLoadBalancer", "Internet", "GatewayManager", "ApiManagement"],
      security_rule.value.source_address_prefix) ? security_rule.value.source_address_prefix : ""
      destination_address_prefix = contains(["*", "VirtualNetwork", "AzureLoadBalancer", "Internet", "GatewayManager", "ApiManagement"],
      security_rule.value.destination_address_prefix) ? security_rule.value.destination_address_prefix : ""

      source_address_prefixes = contains(["*", "VirtualNetwork", "AzureLoadBalancer", "Internet", "GatewayManager", "ApiManagement"],
      security_rule.value.source_address_prefix) ? [] : split(",", security_rule.value.source_address_prefix)
      destination_address_prefixes = contains(["*", "VirtualNetwork", "AzureLoadBalancer", "Internet", "GatewayManager", "ApiManagement"],
      security_rule.value.destination_address_prefix) ? [] : split(",", security_rule.value.destination_address_prefix)

      description = security_rule.value.description
    }
  }
  tags = merge(var.global_tags, each.value.tags)
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_subnet_asssociation" {
  for_each                  = { for k, v in var.nsg_subnet_association_config : k => v }
  subnet_id                 = var.ref_data.subnet_data[format("%s-%s", each.value.vnet_name, each.value.subnet_name)].id
  network_security_group_id = azurerm_network_security_group.nsg_resource[each.value.network_security_group_name].id
  depends_on                = [azurerm_network_security_group.nsg_resource]

  lifecycle {
    ignore_changes = []
  }
}

