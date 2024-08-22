azurerm_application_gateway_config = {
  agw-mhra-sit-uks-01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-sit-uks-network"
    zones               = ["1", "2", "3"]
    firewall_policy_id  = "/subscriptions/afc6d07d-3eac-4228-b97f-e2c24b08b8bc/resourceGroups/rg-mhra-sit-uks-network/providers/Microsoft.Network/applicationGatewayWebApplicationFirewallPolicies/wafappgway-mhra-sit-uks-01"
    force_firewall_policy_association = "true"
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
      name        = "agw-ip-config-mhra-sit-uks-01"
      vnet_name   = "vnet-mhra-sit-uks-h1s01"
      subnet_name = "snet-mhra-sit-uks-h1s01-waf"
    }]

    frontend_port = [{
      name = "agw-http-port-mhra-sit-uks-01"
      port = 80
      }
      , {
        name = "agw-https-port-mhra-sit-uks-01"
        port = 443
    }]

    frontend_ip_configuration = [
      { #Public
        name                          = "agw-frontend-ip-config-mhra-sit-uks-01"
        public_ip_address_name        = "pip-agw-mhra-sit-uks-h1s01"
        private_ip_address            = null
        private_ip_address_allocation = null
        vnet_name                     = "vnet-mhra-sit-uks-h1s01"
        subnet_name                   = "snet-mhra-sit-uks-h1s01-waf"
      },
      { #Private
        name                          = "agw-frontend-ip-config-mhra-sit-uks-02"
        public_ip_address_name        = null
        private_ip_address            = "10.24.10.30"
        private_ip_address_allocation = "Static"
        vnet_name                     = "vnet-mhra-sit-uks-h1s01"
        subnet_name                   = "snet-mhra-sit-uks-h1s01-waf"
      }
    ]

    probes = [
      {
        name                                      = "agw-https-probe-mhra-sit-uks-01"
        protocol                                  = "Https"
        pick_host_name_from_backend_http_settings = false
        host                                      = "ase-rms-sit-uks-02.azurewebsites.net"
        port                                      = 443
        path                                      = "/"
        interval                                  = 30
        timeout                                   = 30
        unhealthy_threshold                       = 3
        minimum_servers                           = 0
      }
    ]

    backend_address_pool = [{
      name         = "agw-backend-pool-mhra-sit-uks-01"
      ip_addresses = []
      fqdns        = ["ase-rms-sit-uks-02.azurewebsites.net"]
    }
]

    backend_http_settings = [{
      name                  = "agw-https-setting-mhra-sit-uks-01"
      cookie_based_affinity = "Disabled"
      path                  = "/"
      port                  = 443
      protocol              = "Https"
      request_timeout       = 60
      pick_host_name_from_backend_address = "true"
      probe_name                          = "agw-https-probe-mhra-sit-uks-01"
      connection_draining  = {
        drain_timeout_sec   = 1
        enabled             = "false"
        }
      }]

    http_listener = [{
      name                           = "agw-http-listener-mhra-sit-uks-01"
      frontend_ip_configuration_name = "agw-frontend-ip-config-mhra-sit-uks-01"
      frontend_port_name             = "agw-https-port-mhra-sit-uks-01"
      protocol                       = "Https"
      ssl_certificate_name           = "cert-mhra-sit-uks-01"
      ssl_profile_name               = "sslp-mhra-sit-uks-01"
      require_sni                    = "false"
    },
    {
      name                           = "agw-http-listener-mhra-sit-uks-02"
      frontend_ip_configuration_name = "agw-frontend-ip-config-mhra-sit-uks-01"
      frontend_port_name             = "agw-http-port-mhra-sit-uks-01"
      protocol                       = "Http"
      require_sni                    = "false"
    }
    ]

    ## Redirect Configuration for routing HTTP Traffic to Https
    redirect_configuration = [
      {
        name                 = "redirect-config-https"
        target_listener_name = "agw-http-listener-mhra-sit-uks-01"
        redirect_type        = "Permanent"
        include_path         = true
        include_query_string = true
      }
    ]

    request_routing_rule = [{
      name                       = "agw-routing-rule-mhra-sit-uks-01"
      rule_type                  = "Basic"
      http_listener_name         = "agw-http-listener-mhra-sit-uks-01"
      backend_address_pool_name  = "agw-backend-pool-mhra-sit-uks-01"
      backend_http_settings_name = "agw-https-setting-mhra-sit-uks-01"
      priority                   = "100"
    },
    {
      name                       = "agw-routing-rule-mhra-sit-uks-02"
      rule_type                  = "Basic"
      http_listener_name         = "agw-http-listener-mhra-sit-uks-02"
      backend_address_pool_name  = ""
      backend_http_settings_name = ""
      redirect_configuration_name= "redirect-config-https"
      priority                   = "101" 
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
        name                = "cert-mhra-sit-uks-01"
        key_vault_secret_id = "https://kvappgw01situks.vault.azure.net/secrets/cert-rms-sit-uks-0133475a94-e8e7-49b1-8d55-e0cb7ca2c462/36348c634bc741a5aaded08da7ab3795"
      }
    ]

    ssl_profiles_config = {
      sslp-mhra-sit-uks-01 = {
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

    managed_identities = ["id-mhra-ident-sit-uks-apgw-001"]
  }
}

## WAF Configuration for SIT Application Gateway Configuration

azure_app_gway_waf_configuration = {
    waf1 = {
        name                = "wafappgway-mhra-sit-uks-01"
        resource_group_name = "rg-mhra-sit-uks-network"
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
