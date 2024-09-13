locals {
  subnet_config_data = {
    for k, v in var.subnet_config : format("%s-%s", v.virtual_network_name, v.name) => v
  }
}

resource "azurerm_virtual_network" "virtual_networks" {
  for_each            = var.virtual_networks
  name                = each.key
  address_space       = each.value.address_space
  location            = var.region
  resource_group_name = each.value.resource_group_name
  tags                = merge(var.global_tags, each.value.tags)
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }

  dynamic "ddos_protection_plan" {
    for_each = (each.value.ddos_config.use_ddos ? [1] : [])
    content {
      id     = var.ref_data.ddos_resources[each.value.ddos_config.name].id
      enable = each.value.ddos_config.use_ddos
    }
  }
  dns_servers = each.value.dns_servers
}

resource "azurerm_subnet" "subnets" {
  for_each             = local.subnet_config_data
  depends_on           = [azurerm_virtual_network.virtual_networks]
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
  service_endpoints    = each.value.service_endpoints

  private_link_service_network_policies_enabled = each.value.allow_private_endpoint

  dynamic "delegation" {
    for_each = each.value.delegation_config
    content {
      name = delegation.key
      dynamic "service_delegation" {
        for_each = delegation.value.service_delegation.enabled ? [0] : []
        content {
          name    = delegation.value.service_delegation.service_name
          actions = delegation.value.service_delegation.actions
        }
      }
    }
  }

  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}