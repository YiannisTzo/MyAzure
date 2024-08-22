azurerm_application_gateway_config = {
  agw-mhra-dev-uks-01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-network"
    zones               = ["1", "2", "3"]
    firewall_policy_id  = "/subscriptions/0c69e674-9156-45be-abfa-baf73b4b5ede/resourceGroups/rg-mhra-dev-uks-network/providers/Microsoft.Network/applicationGatewayWebApplicationFirewallPolicies/wafappgway-mhra-dev-uks-01"
    force_firewall_policy_association = "false"
    tags = {
    PowerOffOnSchedule = "05:00-20:00:on;Sat:off;Sun:off"
    }
    sku = {
      name     = "WAF_v2"
      tier     = "WAF_v2"
      capacity = 2
    }

    autoscale_config = {
      is_applicable = false
      minCapacity   = 2
      maxCapacity   = 3
    }

    gateway_ip_configuration = [{
      name        = "agw-ip-config-mhra-dev-uks-01"
      vnet_name   = "vnet-mhra-dev01-uks-h1s01"
      subnet_name = "snet-mhra-dev01-uks-h1s01-waf"
    }]

    frontend_port = [{
      name = "agw-http-port-mhra-dev-uks-01"
      port = 80
      }
      , {
        name = "agw-https-port-mhra-dev-uks-01"
        port = 443
    }]

    frontend_ip_configuration = [
      { #Public IP config
        name                          = "agw-frontend-ip-config-mhra-dev-uks-01"
        public_ip_address_name        = "pip-agw-mhra-dev-uks-h1s01"
        private_ip_address            = null
        private_ip_address_allocation = null
        vnet_name                     = "vnet-mhra-dev01-uks-h1s01"
        subnet_name                   = "snet-mhra-dev01-uks-h1s01-waf"
      },
      { #Private IP config
        name                          = "agw-frontend-ip-config-mhra-dev-uks-02"
        public_ip_address_name        = null
        private_ip_address            = "10.16.10.30"
        private_ip_address_allocation = "Static"
        vnet_name                     = "vnet-mhra-dev01-uks-h1s01"
        subnet_name                   = "snet-mhra-dev01-uks-h1s01-waf"
      }
    ]

        probes = [
      {
        name                                      = "agw-https-probe-mhra-dev-uks-01"
        protocol                                  = "Https"
        pick_host_name_from_backend_http_settings = false
        host                                      = "ase-rms-dev-uks-02.azurewebsites.net"
        port                                      = 443
        path                                      = "/"
        interval                                  = 30
        timeout                                   = 30
        unhealthy_threshold                       = 3
        minimum_servers                           = 0
        match = {
          status_code = ["200-399"]
        }
      },
      {
        name                                      = "agw-https-probe-mhra-dev-uks-02"
        protocol                                  = "Https"
        pick_host_name_from_backend_http_settings = false
        host                                      = "regulatoryconnect-dev-portal.privatelink.mhra.gov.uk"
        path                                      = "/signin"
        interval                                  = 30
        timeout                                   = 30
        unhealthy_threshold                       = 3
        minimum_servers                           = 0
        match = {
          status_code = []
        }
      },
      {
        name                                      = "agw-https-probe-mhra-dev-uks-03"
        protocol                                  = "Https"
        pick_host_name_from_backend_http_settings = false
        host                                      = "regulatoryconnect-dev-management.privatelink.mhra.gov.uk"
        path                                      = "/ServiceStatus"
        interval                                  = 30
        timeout                                   = 30
        unhealthy_threshold                       = 3
        minimum_servers                           = 0
        match = {
          status_code = []
        }
      },
      {
        name                                      = "agw-https-probe-mhra-dev-uks-04"
        protocol                                  = "Https"
        pick_host_name_from_backend_http_settings = false
        host                                      = "regulatoryconnect-dev-management.privatelink.mhra.gov.uk"
        path                                      = "/status-0123456789abcdef"
        interval                                  = 30
        timeout                                   = 30
        unhealthy_threshold                       = 3
        minimum_servers                           = 0
        match = {
          status_code = []
        }
      }
    ]

    backend_address_pool = [{
      name         = "agw-backend-pool-mhra-dev-uks-01"
      ip_addresses = []
      fqdns        = ["ase-rms-dev01-uks-01.azurewebsites.net"]
    },
    {
      name         = "agw-backend-pool-mhra-dev-uks-02"
      ip_addresses = []
      fqdns        = ["regulatoryconnect-dev-portal.privatelink.mhra.gov.uk"]
    },
    {
      name         = "agw-backend-pool-mhra-dev-uks-03"
      ip_addresses = []
      fqdns        = ["regulatoryconnect-dev-management.privatelink.mhra.gov.uk"]
    },
    {
      name         = "agw-backend-pool-mhra-dev-uks-04"
      ip_addresses = []
      fqdns        = ["regulatoryconnect-dev-api.privatelink.mhra.gov.uk"]
    }    
    ]
    backend_http_settings = [{
      name                                = "agw-https-setting-mhra-dev-uks-01"
      cookie_based_affinity               = "Disabled"
      affinity_cookie_name                = "ApplicationGatewayAffinity"
      path                                = "/"
      port                                = 443
      protocol                            = "Https"
      request_timeout                     = 60
      pick_host_name_from_backend_address = "true"
      probe_name                          = "agw-https-probe-mhra-dev-uks-01"
      connection_draining = {
        drain_timeout_sec = 1
        enabled           = "false"
      }
      },
      {
        name                                = "agw-https-setting-mhra-dev-uks-02"
        cookie_based_affinity               = "Disabled"
        port                                = 443
        protocol                            = "Https"
        request_timeout                     = 60
        pick_host_name_from_backend_address = "true"
        trusted_root_certificate_names      = ["cert-mhra-root-001"]
        probe_name                          = "agw-https-probe-mhra-dev-uks-02"
        connection_draining = {
          drain_timeout_sec = 1
          enabled           = false
        }
       },
      {
        name                                = "agw-https-setting-mhra-dev-uks-03"
        cookie_based_affinity               = "Disabled"
        path                                = "/"
        port                                = 443
        protocol                            = "Https"
        request_timeout                     = 20
        pick_host_name_from_backend_address = "true"
        trusted_root_certificate_names      = ["cert-mhra-root-001"]
        probe_name                          = "agw-https-probe-mhra-dev-uks-03"
        connection_draining = {
          drain_timeout_sec = 1
          enabled           = false
        }
      },
      {
        name                                = "agw-https-setting-mhra-dev-uks-04"
        cookie_based_affinity               = "Disabled"
        path                                = "/"
        port                                = 443
        protocol                            = "Https"
        request_timeout                     = 20
        pick_host_name_from_backend_address = "true"
        trusted_root_certificate_names      = ["cert-mhra-root-001"]
        probe_name                          = "agw-https-probe-mhra-dev-uks-04"
        connection_draining = {
          drain_timeout_sec = 1
          enabled           = false
        }
      }
    ]

    http_listener = [{
      name                           = "agw-http-listener-mhra-dev-uks-01"
      frontend_ip_configuration_name = "agw-frontend-ip-config-mhra-dev-uks-01"
      frontend_port_name             = "agw-https-port-mhra-dev-uks-01"
      protocol                       = "Https"
      ssl_certificate_name           = "cert-mhra-dev-uks-01"
      host_names                     = ["regulatoryconnect-dev.mhra.gov.uk"]
      ssl_profile_name               = "sslp-mhra-dev-uks-01"
    },
    {
      name                           = "agw-http-listener-mhra-dev-uks-02"
      frontend_ip_configuration_name = "agw-frontend-ip-config-mhra-dev-uks-01"
      frontend_port_name             = "agw-http-port-mhra-dev-uks-01"
      protocol                       = "Http"
      host_names                     = ["regulatoryconnect-dev.mhra.gov.uk"]
      ssl_profile_name               = "sslp-mhra-dev-uks-01"
      require_sni                    = "false"
    },
    {
      name                           = "agw-http-listener-mhra-dev-uks-03"
      frontend_ip_configuration_name = "agw-frontend-ip-config-mhra-dev-uks-01"
      frontend_port_name             = "agw-https-port-mhra-dev-uks-01"
      protocol                       = "Https"
      ssl_certificate_name           = "cert-mhra-dev-uks-03"
      host_names                     = ["regulatoryconnect-dev-portal.privatelink.mhra.gov.uk"]
      ssl_profile_name               = "sslp-mhra-dev-uks-01"
      require_sni                    = "true"
    },
    {
      name                           = "agw-http-listener-mhra-dev-uks-04"
      frontend_ip_configuration_name = "agw-frontend-ip-config-mhra-dev-uks-01"
      frontend_port_name             = "agw-https-port-mhra-dev-uks-01"
      protocol                       = "Https"
      ssl_certificate_name           = "cert-mhra-dev-uks-04"
      host_names                     = ["regulatoryconnect-dev-management.privatelink.mhra.gov.uk"]
      ssl_profile_name               = "sslp-mhra-dev-uks-01"
      require_sni                    = "true"
    },
    {
      name                           = "agw-http-listener-mhra-dev-uks-05"
      frontend_ip_configuration_name = "agw-frontend-ip-config-mhra-dev-uks-01"
      frontend_port_name             = "agw-https-port-mhra-dev-uks-01"
      protocol                       = "Https"
      ssl_certificate_name           = "cert-mhra-dev-uks-05"
      host_names                     = ["regulatoryconnect-dev-api.privatelink.mhra.gov.uk"]
      ssl_profile_name               = "sslp-mhra-dev-uks-01"
      require_sni                    = "true"
    }
    ]

    request_routing_rule = [{
      name                       = "agw-routing-rule-mhra-dev-uks-01"
      rule_type                  = "Basic"
      http_listener_name         = "agw-http-listener-mhra-dev-uks-01"
      backend_address_pool_name  = "agw-backend-pool-mhra-dev-uks-01"
      backend_http_settings_name = "agw-https-setting-mhra-dev-uks-01"
      priority                   = "10010"
    }]

    ## Redirect Configuration for routing HTTP Traffic to Https
    redirect_configuration = [
      {
        name                 = "redirect-config-https"
        target_listener_name = "agw-http-listener-mhra-dev-uks-01"
        redirect_type        = "Permanent"
        include_path         = true
        include_query_string = true
      }
    ]

    request_routing_rule = [{
      name                       = "agw-routing-rule-mhra-dev-uks-01"
      rule_type                  = "Basic"
      http_listener_name         = "agw-http-listener-mhra-dev-uks-01"
      backend_address_pool_name  = "agw-backend-pool-mhra-dev-uks-01"
      backend_http_settings_name = "agw-https-setting-mhra-dev-uks-01"
      priority                   = "100"
    }
    ]

    waf_configuration = { ## This deploys a built-in WAF config which is local to each WAF. Not all settings are available. For full custom WAF policies, populate the seperate resource azurerm_web_application_firewall_policy_config below.
      enabled                  = "true"
      firewall_mode            = "Prevention"
      rule_set_type            = "OWASP"
      rule_set_version         = "3.0"
      file_upload_limit_mb     = 100
      request_body_check       = "true"
      max_request_body_size_kb = 128
      exclusion = [
        {
          match_variable          = "RequestHeaderNames"
          selector                = "x-company-secret-header"
          selector_match_operator = "Equals"
        },
        {
          match_variable          = "RequestCookieNames"
          selector                = "too-tasty"
          selector_match_operator = "EndsWith"
      }]
    }

    ssl_certificates_config = [
      {
        name                = "cert-mhra-dev-uks-01"
        key_vault_secret_id = "https://kvappgw01devuks.vault.azure.net/secrets/cert-mhra-dev-uks-01"
      }
    ]

    ssl_profiles_config = {
      sslp-mhra-dev-uks-01 = {
        verify_client_cert_issuer_dn     = false
        trusted_client_certificate_names = []

        ssl_policy = {
          enabled = true
          cipher_suites = [
            "TLS_RSA_WITH_AES_256_CBC_SHA256",
            "TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384",
            "TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256",
            "TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256",
            "TLS_RSA_WITH_AES_128_GCM_SHA256",
            "TLS_RSA_WITH_AES_128_CBC_SHA256"
          ]
          disabled_protocols   = []
          min_protocol_version = "TLSv1_2"
          policy_type          = "Custom"
        }
      }
    }

    managed_identities = ["id-mhra-ident-dev-uks-apgw-001"]
  }
}
