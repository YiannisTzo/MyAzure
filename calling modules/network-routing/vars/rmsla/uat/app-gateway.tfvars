azurerm_application_gateway_config = {
  agw-mhra-uat-uks-01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-uat-uks-network"
    zones               = ["1", "2", "3"]
    tags = {
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
      name        = "agw-ip-config-mhra-uat-uks-01"
      vnet_name   = "vnet-mhra-uat-uks-h1s01"
      subnet_name = "snet-mhra-uat-uks-h1s01-waf"
    }]

    frontend_port = [{
      name = "agw-http-port-mhra-uat-uks-01"
      port = 80
      }
      , {
        name = "agw-https-port-mhra-uat-uks-01"
        port = 443
    }]

    frontend_ip_configuration = [
      { #Public IP config
        name                          = "agw-frontend-ip-config-mhra-uat-uks-01"
        public_ip_address_name        = "pip-agw-mhra-uat-uks-h1s01"
        private_ip_address            = null
        private_ip_address_allocation = null
        vnet_name                     = "vnet-mhra-uat-uks-h1s01"
        subnet_name                   = "snet-mhra-uat-uks-h1s01-waf"
      },
      { #Private IP config
        name                          = "agw-frontend-ip-config-mhra-uat-uks-02"
        public_ip_address_name        = null
        private_ip_address            = "10.17.10.30"
        private_ip_address_allocation = "Static"
        vnet_name                     = "vnet-mhra-uat-uks-h1s01"
        subnet_name                   = "snet-mhra-uat-uks-h1s01-waf"
      }
    ]

        probes = [
      {
        name                                      = "agw-https-probe-mhra-uat-uks-01"
        protocol                                  = "Https"
        pick_host_name_from_backend_http_settings = false
        host                                      = "ase-rms-uat-uks-02.azurewebsites.net"
        port                                      = 443
        path                                      = "/"
        interval                                  = 30
        timeout                                   = 30
        unhealthy_threshold                       = 3
        minimum_servers                           = 0
        match = {
          status_code = ["200-399"]
        }
      }
        ]

    backend_address_pool = [{
      name         = "agw-backend-pool-mhra-uat-uks-01"
      ip_addresses = []
      fqdns        = ["ase-rms-uat-uks-01.azurewebsites.net"]
    }]

    backend_http_settings = [{
      name                  = "agw-http-setting-mhra-uat-uks-01"
      cookie_based_affinity = "Disabled"
      path                  = "/path/"
      port                  = 80
      protocol              = "Http"
      request_timeout       = 60
      host_name             = ""
      pick_host_name_from_backend_address = "false"
      connection_draining  = {
        drain_timeout_sec   = ""
        enabled             = "false"
        }
      },
      {
        name                  = "agw-https-setting-mhra-uat-uks-01"
        cookie_based_affinity = "Disabled"
        path                  = "/path/"
        port                  = 443
        protocol              = "Https"
        request_timeout       = 60
        host_name             = ""
        pick_host_name_from_backend_address = "false"
        connection_draining  = {
          drain_timeout_sec   = ""
          enabled             = "false"
          }
      }]

    http_listener = [{
      name                           = "agw-http-listener-mhra-uat-uks-01"
      frontend_ip_configuration_name = "agw-frontend-ip-config-mhra-uat-uks-01"
      frontend_port_name             = "agw-https-port-mhra-uat-uks-01"
      protocol                       = "Https"
      ssl_certificate_name           = "cert-mhra-uat-uks-01"
      ssl_profile_name               = "sslp-mhra-uat-uks-01"
    }]

    request_routing_rule = [{
      name                       = "agw-routing-rule-mhra-uat-uks-01"
      rule_type                  = "Basic"
      http_listener_name         = "agw-http-listener-mhra-uat-uks-01"
      backend_address_pool_name  = "agw-backend-pool-mhra-uat-uks-01"
      backend_http_settings_name = "agw-http-setting-mhra-uat-uks-01"
      priority                   = "10010"
    }]
    request_routing_rule = [{
      name                       = "agw-routing-rule-mhra-uat-uks-01"
      rule_type                  = "Basic"
      http_listener_name         = "agw-http-listener-mhra-uat-uks-01"
      backend_address_pool_name  = "agw-backend-pool-mhra-uat-uks-01"
      backend_http_settings_name = "agw-https-setting-mhra-uat-uks-01"
      priority                   = "10010"
    }]

    ## Redirect Configuration for routing HTTP Traffic to Https
    redirect_configuration = [
      {
        name                 = "redirect-config-https"
        target_listener_name = "agw-http-listener-mhra-uat-uks-01"
        redirect_type        = "Permanent"
        include_path         = true
        include_query_string = true
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
        name                = "cert-mhra-uat-uks-01"
        key_vault_secret_id = "https://kvappgw01uatuks.vault.azure.net/secrets/cert-mhra-uat-uks-01"
      }
    ]

    ssl_profiles_config = {
      sslp-mhra-uat-uks-01 = {
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

    managed_identities = ["id-mhra-ident-uat-uks-apgw-001"]
  }
}