locals {
  id_by_target_resource_type = {
    # For any other resource type for which private endpoint has to be enabled,
    # please add an entry here.
    storage_account    = lookup(var.ref_data, "storage_acc_data", {})
    key_vault          = lookup(var.ref_data, "keyvault_data", {})
    recovery-svc-vault = lookup(var.ref_data, "rec_svc_vault_data", {})
    data_factory       = lookup(var.ref_data, "data_factory_data", {})
    batch_account      = lookup(var.ref_data, "batch_accounts_data", {})
  }

  private_dns_zone_ids_data = {
    for k, v in var.private_endpoint_config : k =>
    v.private_dns_zone_group == null ? [] : [
      for vi in v.private_dns_zone_group.private_dns_zone_names : var.ref_data.private_dns_zone_data[vi].id
    ]
  }
}

resource "azurerm_private_endpoint" "private_endpoint" {
  for_each            = var.private_endpoint_config
  name                = each.key
  location            = var.region
  resource_group_name = each.value.resource_group_name
  subnet_id           = var.ref_data.subnet_data[format("%s-%s", each.value.vnet_name, each.value.subnet_name)].id

  private_service_connection {
    name                              = each.value.private_service_connection_name
    is_manual_connection              = each.value.is_manual_connection
    private_connection_resource_id    = local.id_by_target_resource_type[each.value.target_resource_type][each.value.target_resource_name].id
    subresource_names                 = length(each.value.subresource_names) > 0 ? each.value.subresource_names : null
    private_connection_resource_alias = each.value.private_connection_resource_alias != "" ? each.value.private_connection_resource_alias : null
    request_message                   = each.value.request_message != "" ? each.value.request_message : null
  }

  dynamic "private_dns_zone_group" {
    for_each = (each.value.private_dns_zone_group != null ? [0] : [])
    content {
      name                 = each.value.private_dns_zone_group.private_dns_zone_group_name
      private_dns_zone_ids = length(each.value.private_dns_zone_group.private_dns_zone_ids) > 0 ? each.value.private_dns_zone_group.private_dns_zone_ids : local.private_dns_zone_ids_data[each.key]
    }
  }

  dynamic "ip_configuration" {
    for_each = (each.value.ip_configuration != null ? each.value.ip_configuration : [])
    content {
      name               = ip_configuration.value.name
      private_ip_address = ip_configuration.value.private_ip_address
      subresource_name   = ip_configuration.value.subresource_name
      member_name        = ip_configuration.value.member_name
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
      tags
    ]
    # Ignore lifecycle block added due to lack of support for source_image_reference / source_image_id, issue listed under https://github.com/hashicorp/terraform-provider-azurerm/issues/19614 / https://github.com/hashicorp/terraform-provider-azurerm/issues/8195
  }
}
