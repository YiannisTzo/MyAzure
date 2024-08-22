resource "azurerm_firewall" "firewall_resources" {
  for_each            = var.firewall_config
  name                = each.key
  depends_on          = [azurerm_firewall_policy_rule_collection_group.firewall_policy_rcg]
  location            = var.region
  resource_group_name = each.value.resource_group_name
  sku_name            = each.value.sku_name
  sku_tier            = each.value.sku_tier
  firewall_policy_id  = each.value.firewall_policy_name != "" ? azurerm_firewall_policy.firewall_policy[each.value.firewall_policy_name].id : null
  zones               = each.value.zones

  ip_configuration {
    name                 = "configuration"
    subnet_id            = var.ref_data.subnet_data[format("%s-%s", each.value.ip_config.vnet_name, each.value.ip_config.subnet_name)].id
    public_ip_address_id = var.ref_data.static_ip_data[each.value.ip_config.static_ip_address_name].id
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
  dynamic "management_ip_configuration" {
    for_each = each.value.management_ip_configuration.is_applicable ? [0] : []
    content {
      name                 = each.value.management_ip_configuration.name
      subnet_id            = var.ref_data.subnet_data[format("%s-%s", each.value.management_ip_configuration.vnet_name, each.value.management_ip_configuration.subnet_name)].id
      public_ip_address_id = var.ref_data.static_ip_data[each.value.management_ip_configuration.static_ip_address_name].id
    }
  }
}

resource "azurerm_firewall_policy" "firewall_policy" {
  for_each            = var.firewall_policy_config
  name                = each.key
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku
  location            = var.region
  private_ip_ranges   = each.value.private_ip_ranges

  dynamic "intrusion_detection" {
    for_each = each.value.intrusion_detection.mode == "Off" ? [] : [0]
    content { mode = each.value.intrusion_detection.mode }
  }

  tags = merge(
    var.firewall_policy_global_tags, each.value.tags
  )
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }

  dynamic "dns" {
    for_each = each.value.dns_config.is_applicable ? [0] : []
    content {
      proxy_enabled = each.value.dns_config.proxy_enabled
      servers       = each.value.dns_config.servers
    }
  }

  dynamic "threat_intelligence_allowlist" {
    for_each = each.value.threat_intelligence_allowlist_config.is_applicable ? [0] : []
    content {
      fqdns        = each.value.threat_intelligence_allowlist_config.fqdns
      ip_addresses = each.value.threat_intelligence_allowlist_config.ip_addresses
    }
  }
  threat_intelligence_mode = each.value.threat_intelligence_mode
}

resource "azurerm_firewall_policy_rule_collection_group" "firewall_policy_rcg" {
  for_each           = var.firewall_policy_rule_collection_group_config
  name               = each.key
  depends_on         = [azurerm_firewall_policy.firewall_policy]
  firewall_policy_id = azurerm_firewall_policy.firewall_policy[each.value.firewall_policy_name].id
  priority           = each.value.priority
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }

  dynamic "network_rule_collection" {
    for_each = each.value.network_rule_collection == null ? [] : (
      [for k, v in each.value.network_rule_collection : { name = k
    data = v }])
    content {
      name     = network_rule_collection.value.name
      priority = network_rule_collection.value.data.priority
      action   = network_rule_collection.value.data.action
      dynamic "rule" {
        for_each = network_rule_collection.value.data.rule
        content {
          name                  = rule.key
          protocols             = rule.value.protocols
          source_addresses      = rule.value.source_addresses
          destination_addresses = rule.value.destination_addresses
          destination_ports     = rule.value.destination_ports
        }
      }
    }
  }

  dynamic "application_rule_collection" {
    for_each = each.value.application_rule_collection == null ? [] : (
      [for k, v in each.value.application_rule_collection : { name = k
    data = v }])
    content {
      name     = application_rule_collection.value.name
      priority = application_rule_collection.value.data.priority
      action   = application_rule_collection.value.data.action

      dynamic "rule" {
        for_each = application_rule_collection.value.data.rule
        content {
          name = rule.key

          dynamic "protocols" {
            for_each = rule.value.protocols
            content {
              port = protocols.value.port
              type = protocols.value.type
            }
          }

          source_addresses      = rule.value.source_addresses
          source_ip_groups      = rule.value.source_ip_groups
          web_categories        = rule.value.web_categories
          destination_fqdns     = rule.value.destination_fqdns
          terminate_tls         = rule.value.terminate_tls
          destination_addresses = rule.value.destination_addresses
          destination_fqdn_tags = rule.value.destination_fqdn_tags
          destination_urls      = rule.value.destination_urls

        }
      }
    }
  }
}