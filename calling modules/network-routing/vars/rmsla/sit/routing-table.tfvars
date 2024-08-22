# Route table details
route_tables_config = {
  udr-snet-mhra-sit-uks-h1s01-data = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-sit-uks-network"
    tags = {
    }
    disable_bgp_route_propagation = true
    routing_rules = [
      {
        is_applicable        = true
        rule_name            = "DefaultViaFirewall"
        cidr                 = "0.0.0.0/0"
        route_target_type    = "VirtualAppliance"
        route_target_address = ""
        route_target_name    = "afw-mhra-cnct-uks-h1s00"
      }
    ]
  }

  udr-snet-mhra-sit-uks-h1s01-app = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-sit-uks-network"
    tags = {
    }
    disable_bgp_route_propagation = true
    routing_rules = [
      {
        is_applicable        = true
        rule_name            = "DefaultViaFirewall"
        cidr                 = "0.0.0.0/0"
        route_target_type    = "VirtualAppliance"
        route_target_address = ""
        route_target_name    = "afw-mhra-cnct-uks-h1s00"
      }
    ]
  }

  udr-snet-mhra-sit-uks-h1s01-presentation = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-sit-uks-network"
    tags = {
    }
    disable_bgp_route_propagation = true
    routing_rules = [
      {
        is_applicable        = true
        rule_name            = "DefaultViaFirewall"
        cidr                 = "0.0.0.0/0"
        route_target_type    = "VirtualAppliance"
        route_target_address = ""
        route_target_name    = "afw-mhra-cnct-uks-h1s00"
      }
    ]
  }

  udr-snet-mhra-sit-uks-h1s01-waf = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-sit-uks-network"
    tags = {
    }
    disable_bgp_route_propagation = true
    routing_rules = [
      {
        is_applicable        = true
        rule_name            = "vNetLocal"
        cidr                 = "10.24.0.0/16"
        route_target_type    = "VnetLocal"
        route_target_address = ""
        route_target_name    = ""
      }
    ]
  }

  udr-snet-mhra-sit-uks-h1s01-lgappsubnet = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-sit-uks-network"
    tags = {
    }
    disable_bgp_route_propagation = true
    routing_rules = [
      {
        is_applicable        = true
        rule_name            = "DefaultViaFirewall"
        cidr                 = "0.0.0.0/0"
        route_target_type    = "VirtualAppliance"
        route_target_address = ""
        route_target_name    = "afw-mhra-cnct-uks-h1s00"
      }
    ]
  }

  udr-snet-mhra-sit-uks-h1s01-azfuncsubnet = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-sit-uks-network"
    tags = {
    }
    disable_bgp_route_propagation = true
    routing_rules = [
      {
        is_applicable        = true
        rule_name            = "DefaultViaFirewall"
        cidr                 = "0.0.0.0/0"
        route_target_type    = "VirtualAppliance"
        route_target_address = ""
        route_target_name    = "afw-mhra-cnct-uks-h1s00"
      }
    ]
  }

  udr-snet-mhra-sit-uks-h1s01-appservicessubnet = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-sit-uks-network"
    tags = {
    }
    disable_bgp_route_propagation = true
    routing_rules = [
      {
        is_applicable        = true
        rule_name            = "DefaultViaFirewall"
        cidr                 = "0.0.0.0/0"
        route_target_type    = "VirtualAppliance"
        route_target_address = ""
        route_target_name    = "afw-mhra-cnct-uks-h1s00"
      }
    ]
  }

    udr-snet-mhra-sit-uks-h1s01-redis = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-sit-uks-network"
    tags = {
    }
    disable_bgp_route_propagation = true
    routing_rules = [
      {
        is_applicable        = true
        rule_name            = "DefaultViaFirewall"
        cidr                 = "0.0.0.0/0"
        route_target_type    = "VirtualAppliance"
        route_target_address = ""
        route_target_name    = "afw-mhra-cnct-uks-h1s00"
      }
    ]
  }

    udr-snet-mhra-sit-uks-h1s01-apimsubnet = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-sit-uks-network"
    tags = {
    }
    disable_bgp_route_propagation = true
    routing_rules = [
      {
        is_applicable        = true
        rule_name            = "DefaultViaFirewall"
        cidr                 = "0.0.0.0/0"
        route_target_type    = "VirtualAppliance"
        route_target_address = ""
        route_target_name    = "afw-mhra-cnct-uks-h1s00"
      }
    ]
  }


}

# Route table subnet details
route_table_subnets_config = [
  {
    provider_alias   = "spoke1-sub"
    is_applicable    = true
    vnet_name        = "vnet-mhra-sit-uks-h1s01"
    subnet_name      = "snet-mhra-sit-uks-h1s01-data"
    route_table_name = "udr-snet-mhra-sit-uks-h1s01-data"
  },
  {
    provider_alias   = "spoke1-sub"
    is_applicable    = true
    vnet_name        = "vnet-mhra-sit-uks-h1s01"
    subnet_name      = "snet-mhra-sit-uks-h1s01-app"
    route_table_name = "udr-snet-mhra-sit-uks-h1s01-app"
  },
  {
    provider_alias   = "spoke1-sub"
    is_applicable    = true
    vnet_name        = "vnet-mhra-sit-uks-h1s01"
    subnet_name      = "snet-mhra-sit-uks-h1s01-presentation"
    route_table_name = "udr-snet-mhra-sit-uks-h1s01-presentation"
  },
  {
    provider_alias   = "spoke1-sub"
    is_applicable    = true
    vnet_name        = "vnet-mhra-sit-uks-h1s01"
    subnet_name      = "snet-mhra-sit-uks-h1s01-waf"
    route_table_name = "udr-snet-mhra-sit-uks-h1s01-waf"
  },
  {
    provider_alias   = "spoke1-sub"
    is_applicable    = true
    vnet_name        = "vnet-mhra-sit-uks-h1s01"
    subnet_name      = "snet-mhra-sit-uks-h1s01-lgappsubnet"
    route_table_name = "udr-snet-mhra-sit-uks-h1s01-lgappsubnet"
  },
  {
    provider_alias   = "spoke1-sub"
    is_applicable    = true
    vnet_name        = "vnet-mhra-sit-uks-h1s01"
    subnet_name      = "snet-mhra-sit-uks-h1s01-azfuncsubnet"
    route_table_name = "udr-snet-mhra-sit-uks-h1s01-azfuncsubnet"
  },
  {
    provider_alias   = "spoke1-sub"
    is_applicable    = true
    vnet_name        = "vnet-mhra-sit-uks-h1s01"
    subnet_name      = "snet-mhra-sit-uks-h1s01-appservicessubnet"
    route_table_name = "udr-snet-mhra-sit-uks-h1s01-appservicessubnet"
  },
  {
    provider_alias   = "spoke1-sub"
    is_applicable    = true
    vnet_name        = "vnet-mhra-sit-uks-h1s01"
    subnet_name      = "snet-mhra-sit-uks-h1s01-redis"
    route_table_name = "udr-snet-mhra-sit-uks-h1s01-redis"
  },

  {
    provider_alias   = "spoke1-sub"
    is_applicable    = true
    vnet_name        = "vnet-mhra-sit-uks-h1s01"
    subnet_name      = "snet-mhra-sit-uks-h1s01-apimsubnet"
    route_table_name = "udr-snet-mhra-sit-uks-h1s01-apimsubnet"
  }
]