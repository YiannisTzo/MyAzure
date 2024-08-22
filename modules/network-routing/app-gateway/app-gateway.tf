resource "azurerm_application_gateway" "app_gateway" {
  for_each            = var.azurerm_application_gateway_config
  name                = each.key
  resource_group_name = each.value.resource_group_name
  tags                = merge(var.global_tags, each.value.tags)
  location            = var.region
  zones               = each.value.zones
  firewall_policy_id  = each.value.firewall_policy_id
  force_firewall_policy_association = each.value.force_firewall_policy_association
  sku {
    name     = each.value.sku.name
    tier     = each.value.sku.tier
    capacity = (!each.value.autoscale_config.is_applicable) ? each.value.sku.capacity : null
  }

  dynamic "autoscale_configuration" {
    for_each = each.value.autoscale_config.is_applicable ? [0] : []
    content {
      min_capacity = each.value.autoscale_config.minCapacity
      max_capacity = each.value.autoscale_config.maxCapacity
    }
  }

  # probes added recently by itzomiad
  dynamic "probe" {
    for_each = try(each.value.probes, [])
    content {
      name                                      = probe.value.name
      interval                                  = probe.value.interval
      minimum_servers                           = probe.value.minimum_servers
      port                                      = probe.value.port
      path                                      = probe.value.path
      pick_host_name_from_backend_http_settings = probe.value.pick_host_name_from_backend_http_settings
      protocol                                  = probe.value.protocol
      timeout                                   = probe.value.timeout
      unhealthy_threshold                       = probe.value.unhealthy_threshold
      host                                      = try(probe.value.host, null)
    }
  }

  # redirect configuration added recently by itzomiad
    dynamic "redirect_configuration" {
    for_each = try(each.value.redirect_configuration, [])
    content {
      name                  = redirect_configuration.value.name
      redirect_type         = redirect_configuration.value.redirect_type
      target_listener_name  = try(redirect_configuration.value.target_listener_name, null)
      target_url            = try(redirect_configuration.value.target_url, null)
      include_path          = try(redirect_configuration.value.include_path, null)
      include_query_string  = try(redirect_configuration.value.include_query_string, null)
    }
  }

  dynamic "gateway_ip_configuration" {
    for_each = each.value.gateway_ip_configuration
    content {
      name      = gateway_ip_configuration.value.name
      subnet_id = var.ref_data.subnet_data[format("%s-%s", gateway_ip_configuration.value.vnet_name, gateway_ip_configuration.value.subnet_name)].id
    }
  }
  dynamic "frontend_port" {
    for_each = each.value.frontend_port
    content {
      name = frontend_port.value.name
      port = frontend_port.value.port
    }
  }
  dynamic "frontend_ip_configuration" {
    for_each = each.value.frontend_ip_configuration
    content {
      name = frontend_ip_configuration.value.name
      public_ip_address_id = (frontend_ip_configuration.value.public_ip_address_name == null ||
      frontend_ip_configuration.value.public_ip_address_name == "") ? "" : var.ref_data.static_ip_data[frontend_ip_configuration.value.public_ip_address_name].id
      private_ip_address            = frontend_ip_configuration.value.private_ip_address
      private_ip_address_allocation = frontend_ip_configuration.value.private_ip_address_allocation
      subnet_id = (frontend_ip_configuration.value.public_ip_address_name != null
        && frontend_ip_configuration.value.public_ip_address_name != "") ? null : (
        var.ref_data.subnet_data[format("%s-%s", frontend_ip_configuration.value.vnet_name, frontend_ip_configuration.value.subnet_name)].id
      )
    }
  }
  dynamic "backend_address_pool" {
    for_each = each.value.backend_address_pool
    content {
      name         = backend_address_pool.value.name
      fqdns        = backend_address_pool.value.fqdns
      ip_addresses = backend_address_pool.value.ip_addresses
    }
  }
  dynamic "backend_http_settings" {
    for_each = each.value.backend_http_settings
    content {
      name                                = backend_http_settings.value.name
      cookie_based_affinity               = backend_http_settings.value.cookie_based_affinity
      affinity_cookie_name                = backend_http_settings.value.affinity_cookie_name
      path                                = backend_http_settings.value.path
      port                                = backend_http_settings.value.port
      protocol                            = backend_http_settings.value.protocol
      request_timeout                     = backend_http_settings.value.request_timeout
      host_name                           = backend_http_settings.value.host_name
      probe_name                          = backend_http_settings.value.probe_name
      pick_host_name_from_backend_address = backend_http_settings.value.pick_host_name_from_backend_address
      trusted_root_certificate_names      = backend_http_settings.value.trusted_root_certificate_names
      dynamic "connection_draining" {
        for_each = backend_http_settings.value.connection_draining.enabled ? [0] : []
        content {
          drain_timeout_sec = connection_draining.value.drain_timeout_sec == "" ? null : connection_draining.value.drain_timeout_sec
          enabled           = connection_draining.value.enabled == "" ? null : connection_draining.value.enabled
        }
      }
    }
  }
  dynamic "http_listener" {
    for_each = each.value.http_listener
    content {
      name                           = http_listener.value.name
      frontend_ip_configuration_name = http_listener.value.frontend_ip_configuration_name
      frontend_port_name             = http_listener.value.frontend_port_name
      protocol                       = http_listener.value.protocol
      ssl_certificate_name           = http_listener.value.ssl_certificate_name
      host_name                      = http_listener.value.host_name
      host_names                     = http_listener.value.host_names
      ssl_profile_name               = http_listener.value.ssl_profile_name
      require_sni                    = http_listener.value.require_sni
    }
  }
  dynamic "request_routing_rule" {
    for_each = each.value.request_routing_rule
    content {
      name                       = request_routing_rule.value.name
      rule_type                  = request_routing_rule.value.rule_type
      http_listener_name         = request_routing_rule.value.http_listener_name
      backend_address_pool_name  = request_routing_rule.value.backend_address_pool_name
      backend_http_settings_name = request_routing_rule.value.backend_http_settings_name
      priority                   = request_routing_rule.value.priority == "" ? null : request_routing_rule.value.priority
    }
  }
  dynamic "waf_configuration" { # deploys a built-in WAF config which is local to each WAF. Not all settings are available. For full custom WAF policies, use the azurerm_web_application_firewall_policy resource below. Cannot use both types together.
    for_each = (each.value.waf_configuration != null ? [0] : [])
    content {
      enabled                  = each.value.waf_configuration.enabled
      firewall_mode            = each.value.waf_configuration.firewall_mode
      rule_set_type            = each.value.waf_configuration.rule_set_type
      rule_set_version         = each.value.waf_configuration.rule_set_version
      file_upload_limit_mb     = each.value.waf_configuration.file_upload_limit_mb
      request_body_check       = each.value.waf_configuration.request_body_check
      max_request_body_size_kb = each.value.waf_configuration.max_request_body_size_kb
      dynamic "exclusion" {
        for_each = each.value.waf_configuration.exclusion
        content {
          match_variable          = exclusion.value.match_variable
          selector_match_operator = exclusion.value.selector_match_operator
          selector                = exclusion.value.selector
        }
      }
    }
  }

  dynamic "ssl_certificate" {
    for_each = each.value.ssl_certificates_config
    content {
      name                = ssl_certificate.value.name
      key_vault_secret_id = ssl_certificate.value.key_vault_secret_id != "" ? ssl_certificate.value.key_vault_secret_id : null
    }
  }

  dynamic "ssl_profile" {
    for_each = each.value.ssl_profiles_config
    content {
      name                         = ssl_profile.key
      verify_client_cert_issuer_dn = ssl_profile.value.verify_client_cert_issuer_dn
      dynamic "ssl_policy" {
        for_each = ssl_profile.value.ssl_policy.enabled ? [0] : []
        content {
          cipher_suites        = ssl_profile.value.ssl_policy.cipher_suites
          disabled_protocols   = ssl_profile.value.ssl_policy.disabled_protocols
          min_protocol_version = ssl_profile.value.ssl_policy.min_protocol_version
          policy_type          = ssl_profile.value.ssl_policy.policy_type
        }
      }
    }
  }

  dynamic "identity" {
    for_each = length(each.value.managed_identities) > 0 ? [0] : []
    content {
      type         = "UserAssigned"
      identity_ids = [for v in each.value.managed_identities : var.ref_data.managed_id_data[v].id]
    }
  }

  depends_on = [
  ]
  
  lifecycle {
   ignore_changes =  all
    #ssl_certificate
    #redirect_configuration,
    #request_routing_rule
    #force_firewall_policy_association
   
 }

}