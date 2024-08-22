variable "azurerm_application_gateway_config" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    resource_group_name = string
    tags                = map(string)
    zones               = list(string)
    firewall_policy_id  = optional(string)
    force_firewall_policy_association = optional(bool)
    sku = object({
      name     = string
      tier     = string
      capacity = number
      }
    )

    autoscale_config = object({
      is_applicable = bool
      minCapacity   = number
      maxCapacity   = number
    })

    gateway_ip_configuration = list(object({
      name        = string
      subnet_name = string
      vnet_name   = string
    }))
    frontend_port = list(object({
      name = string
      port = number
    }))
    frontend_ip_configuration = list(object({
      name                          = string
      public_ip_address_name        = string
      private_ip_address            = string
      private_ip_address_allocation = string
      subnet_name                   = string
      vnet_name                     = string
    }))
    backend_address_pool = list(object({
      name         = string
      fqdns        = list(string)
      ip_addresses = list(string)
    }))
    backend_http_settings = list(object({
      name                                = string
      cookie_based_affinity               = string
      affinity_cookie_name                = optional(string)
      path                                = optional(string)
      port                                = number
      protocol                            = string
      request_timeout                     = number
      host_name                           = optional(string)
      probe_name                          = optional(string)
      pick_host_name_from_backend_address = bool
      trusted_root_certificate_names      = optional(list(string))
      connection_draining = object({
        drain_timeout_sec = string
        enabled           = bool
      })
    }))
    probes = list(object({
      host                                      = optional(string)
      interval                                  = number
      name                                      = string
      protocol                                  = string
      path                                      = string
      timeout                                   = number
      unhealthy_threshold                       = number
      port                                      = optional(number)
      pick_host_name_from_backend_http_settings = optional(bool)
      match = optional(object({
      body        = optional(string) # Optional: A snippet from the Response Body which must be present in the Response
      status_code = list(string)     # Required: A list of allowed status codes for this Health Probe
    }))
      minimum_servers                           = optional(number)
    }))
    redirect_configuration = list(object({
      name                 = string
      redirect_type        = string
      target_listener_name = optional(string)
      target_url           = optional(string)
      include_path         = optional(bool)
      include_query_string = optional(bool)
    }))
    http_listener = list(object({
      name                           = string
      frontend_ip_configuration_name = string
      frontend_port_name             = string
      protocol                       = string
      ssl_certificate_name           = optional(string)
      host_name                      = optional(string)
      host_names                     = optional(list(string))
      ssl_profile_name               = optional(string)
      require_sni                    = optional(bool)
    }))
    request_routing_rule = list(object({
      name                        = string
      rule_type                   = string
      http_listener_name          = string
      backend_address_pool_name   = optional(string)
      backend_http_settings_name  = optional(string)
      priority                    = optional(string)
      url_path_map_name           = optional(string)
      redirect_configuration_name = optional(string)
    }))
    waf_configuration = object({
      enabled                  = bool
      firewall_mode            = string
      rule_set_type            = string
      rule_set_version         = string
      file_upload_limit_mb     = string
      request_body_check       = bool
      max_request_body_size_kb = string
      exclusion = list(object({
        match_variable          = string
        selector_match_operator = string
        selector                = string
      }))
    })

    ssl_certificates_config = list(object({
      name                = string
      key_vault_secret_id = string
    }))

    ssl_profiles_config = map(object({
      verify_client_cert_issuer_dn     = bool
      trusted_client_certificate_names = list(string)
      ssl_policy = object({
        enabled              = bool
        cipher_suites        = list(string)
        disabled_protocols   = list(string)
        min_protocol_version = string
        policy_type          = string
      })
    }))

    managed_identities = list(string)
    })
  )
}
variable "global_tags" {
  type = map(string)
}

variable "crud_timeouts" {
  type = map(string)
}

variable "region" {
  type = string
}
variable "ref_data" {
  type = object({
    subnet_data     = any
    static_ip_data  = any
    managed_id_data = any
  })
}

# Variables for WAF configuration

variable "azure_app_gway_waf_configuration" {}