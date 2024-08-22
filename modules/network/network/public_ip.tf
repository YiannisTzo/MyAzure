resource "azurerm_public_ip" "static_ips" {
  for_each            = var.static_ip_address_config
  name                = each.key
  location            = var.region
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_type
  sku                 = each.value.sku
  zones               = each.value.zones
  domain_name_label   = each.value.domain_name_label
  tags                = merge(var.global_tags, each.value.tags)
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}