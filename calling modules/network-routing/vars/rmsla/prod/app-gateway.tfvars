azurerm_application_gateway_config = {
  agw-mhra-prod-uks-01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-network"
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
      name        = "agw-ip-config-mhra-prod-uks-01"
      vnet_name   = "vnet-mhra-prod-uks-h1s01"
      subnet_name = "snet-mhra-prod-uks-h1s01-waf"
    }]

    frontend_port = [{
      name = "agw-http-port-mhra-prod-uks-01"
      port = 80
      }
      , {
        name = "agw-https-port-mhra-prod-uks-01"
        port = 443
    }]

    frontend_ip_configuration = [
      { #Public IP config
        name                          = "agw-frontend-ip-config-mhra-prod-uks-01"
        public_ip_address_name        = "pip-agw-mhra-prod-uks-h1s01"
        private_ip_address            = null
        private_ip_address_allocation = null
        vnet_name                     = "vnet-mhra-prod-uks-h1s01"
        subnet_name                   = "snet-mhra-prod-uks-h1s01-waf"
      },
      { #Private IP config
        name                          = "agw-frontend-ip-config-mhra-prod-uks-02"
        public_ip_address_name        = null
        private_ip_address            = "10.18.10.30"
        private_ip_address_allocation = "Static"
        vnet_name                     = "vnet-mhra-prod-uks-h1s01"
        subnet_name                   = "snet-mhra-prod-uks-h1s01-waf"
      }
    ]

    probes = [
      {
        name                                      = "apgw-https-probe-mhra-prod-uks-01"
        protocol                                  = "Https"
        pick_host_name_from_backend_http_settings = false
        host                                      = "ase-rms-prod01-uks-01.azurewebsites.net"
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
      name         = "apgw-backend-pool-mhra-prod-uks-01"
      ip_addresses = []
      fqdns        = ["ase-rms-prod01-uks-01.azurewebsites.net"]
    }]

    backend_http_settings = [{
      name                  = "apgw-https-setting-mhra-prod-uks-01"
      cookie_based_affinity = "Disabled"
      path                  = "/"
      port                  = 443
      protocol              = "Https"
      request_timeout       = 60
      host_name             = ""
      pick_host_name_from_backend_address = "false"
      connection_draining  = {
        drain_timeout_sec   = 1
        enabled             = "false"
        }
      },
      {
        name                  = "agw-https-setting-mhra-prod-uks-01"
        cookie_based_affinity = "Disabled"
        path                  = "/path/"
        port                  = 443
        protocol              = "Https"
        request_timeout       = 60
        host_name             = ""
        pick_host_name_from_backend_address = "true"
        connection_draining  = {
          drain_timeout_sec   = "1"
          enabled             = "false"
        }
    }]

    http_listener = [{
      name                           = "apgw-http-listener-mhra-prod-uks-01"
      frontend_ip_configuration_name = "agw-frontend-ip-config-mhra-prod-uks-01"
      frontend_port_name             = "agw-https-port-mhra-prod-uks-01"
      protocol                       = "Https"
      ssl_certificate_name           = "cert-mhra-prod-uks-01"
      ssl_profile_name               = "sslp-mhra-prod-uks-01"
    },
    {
      name                           = "apgw-http-listener-mhra-prod-uks-02"
      frontend_ip_configuration_name = "agw-frontend-ip-config-mhra-prod-uks-01"
      frontend_port_name             = "agw-http-port-mhra-prod-uks-01"
      protocol                       = "Http"
      require_sni                    = "false"
    }]

    request_routing_rule = [{
      name                       = "agw-routing-rule-mhra-prod-uks-01"
      rule_type                  = "Basic"
      http_listener_name         = "agw-http-listener-mhra-prod-uks-01"
      backend_address_pool_name  = "agw-backend-pool-mhra-prod-uks-01"
      backend_http_settings_name = "agw-http-setting-mhra-prod-uks-01"
      priority                   = ""
    }]

    ## Redirect Configuration for routing HTTP Traffic to Https
    redirect_configuration = [
      {
        name                 = "redirect-config-https"
        target_listener_name = "apgw-http-listener-mhra-prod-uks-01"
        redirect_type        = "Permanent"
        include_path         = true
        include_query_string = true
      }
    ]

    request_routing_rule = [{
      name                       = "apgw-routing-rule-mhra-prod-uks-01"
      rule_type                  = "Basic"
      http_listener_name         = "apgw-http-listener-mhra-prod-uks-01"
      backend_address_pool_name  = "apgw-backend-pool-mhra-prod-uks-01"
      backend_http_settings_name = "apgw-https-setting-mhra-prod-uks-01"
      priority                   = "100"
    },
    {
      name                       = "apgw-routing-rule-mhra-prod-uks-02"
      rule_type                  = "Basic"
      http_listener_name         = "apgw-http-listener-mhra-prod-uks-01"
      backend_address_pool_name  = ""
      backend_http_settings_name = ""
      redirect_configuration_name= "redirect-config-https"
      priority                   = "50"
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
        name                = "cert-mhra-prod-uks-01"
        key_vault_secret_id = "https://kvappgw01produks.vault.azure.net/secrets/cert-mhra-prod-uks-01"
      }
    ]

    ssl_profiles_config = {
      sslp-mhra-prod-uks-01 = {
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

    managed_identities = ["id-mhra-ident-prod-uks-apgw-001"]
  }
}
/*
## WAF Configuration for PROD Application Gateway Configuration

azure_app_gway_waf_configuration = {
    waf1 = {
        name                = "wafappgway-mhra-prod-uks-01"
        resource_group_name = "rg-mhra-prod-uks-network"
        location            = "uksouth"
        ## Add custom rules to only Allow MHRA Apporved IP ranges for waf configuration
        custom_rules = [
            {
                enabled = false
                name    = "ApprovedIPRangesAllowed"
                priority = 10
                rule_type = "MatchRule"
                action    = "Block"
                match_conditions = [
                    {
                        operator           = "IPMatch"
                        negation_condition = true
                        match_values       = [
                          "37.130.233.49/32",
                          "37.130.234.1/32",
                          "31.126.105.231/32",
                          "115.187.62.165/32"
                          ]
                        match_variables = [
                            {
                                variable_name = "RemoteAddr"
                            }
                        ]
                    }
                ]

            }
        ]

        ## Policy setttings
        policy_settings = [
            {
                enabled                           = true
                mode                              = "Prevention"
                request_body_check                = true
                file_upload_limit_in_mb           = 100
                max_request_body_size_in_kb       = 128
                request_body_inspect_limit_in_kb  = 128
                max_request_body_size_in_kb       = 128
            }
        ]

        managed_rules = [
            {
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
                    }
                ]

                managed_rule_set = [
                    {
                        type    = "OWASP"
                        version = "3.2"
                        rule_group_override = []
                    },
                    {
                        type    = "Microsoft_BotManagerRuleSet"
                        version = "1.0"
                        rule_group_override = []
                    }
                ]
            }
        ]

    }
}       
*/