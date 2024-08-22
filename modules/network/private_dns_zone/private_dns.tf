resource "azurerm_private_dns_zone" "private_dns_zone" {
  for_each            = var.private_dns_zone_config
  name                = each.key
  resource_group_name = each.value.resource_group_name

  dynamic "soa_record" {
    for_each = (each.value.soa_record.use_soa_record ? [1] : [])
    content {
      email        = each.value.soa_record.email
      expire_time  = each.value.soa_record.expire_time
      minimum_ttl  = each.value.soa_record.minimum_ttl
      refresh_time = each.value.soa_record.refresh_time
      retry_time   = each.value.soa_record.retry_time
      ttl          = each.value.soa_record.ttl
      tags         = each.value.soa_record.soa_record_tags
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
   ignore_changes = [
    number_of_record_sets
   ]
 }
}

resource "azurerm_private_dns_zone_virtual_network_link" "private_dns_zone_vnet_link" {
  for_each              = var.private_dns_zone_vnet_link_config
  resource_group_name   = each.value.resource_group_name
  name                  = each.key
  private_dns_zone_name = each.value.private_dns_zone_name
  virtual_network_id    = var.ref_data.remote_vnet_resources[each.value.virtual_network_name].id
  registration_enabled  = each.value.registration_enabled

  tags = merge(var.global_tags, each.value.tags)
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}