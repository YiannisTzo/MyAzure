# Network module

# virtual network details
virtual_networks = {
  vnet-mhra-perf-uks-h1s01 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    address_space  = ["10.25.0.0/16"]
    tags = {
    }
    resource_group_name = "rg-mhra-perf-uks-network"

    ddos_config = {
      name     = ""
      use_ddos = false
    }
    dns_servers = []
  }
}

# Separate subnet config
subnet_config = [
  {
    provider_alias         = "spoke1-sub"
    is_applicable          = true
    resource_group_name    = "rg-mhra-perf-uks-network"
    virtual_network_name   = "vnet-mhra-perf-uks-h1s01"
    address_prefixes       = ["10.25.10.0/24"]
    name                   = "snet-mhra-perf-uks-h1s01-waf"
    allow_private_endpoint = false
    service_endpoints      = ["Microsoft.KeyVault"]
    delegation_config      = {}
  }
  , {
    provider_alias         = "spoke1-sub"
    is_applicable          = true
    resource_group_name    = "rg-mhra-perf-uks-network"
    virtual_network_name   = "vnet-mhra-perf-uks-h1s01"
    address_prefixes       = ["10.25.12.0/22"]
    name                   = "snet-mhra-perf-uks-h1s01-presentation"
    allow_private_endpoint = true
    service_endpoints      = ["Microsoft.Storage"]
    delegation_config      = {}
  }
  , {
    provider_alias         = "spoke1-sub"
    is_applicable          = true
    resource_group_name    = "rg-mhra-perf-uks-network"
    virtual_network_name   = "vnet-mhra-perf-uks-h1s01"
    address_prefixes       = ["10.25.16.0/22"]
    name                   = "snet-mhra-perf-uks-h1s01-app"
    allow_private_endpoint = true
    service_endpoints      = []
    delegation_config      = {}
  }
  , {
    provider_alias         = "spoke1-sub"
    is_applicable          = true
    resource_group_name    = "rg-mhra-perf-uks-network"
    virtual_network_name   = "vnet-mhra-perf-uks-h1s01"
    address_prefixes       = ["10.25.20.0/22"]
    name                   = "snet-mhra-perf-uks-h1s01-data"
    allow_private_endpoint = true
    service_endpoints      = ["Microsoft.Storage"]
    delegation_config      = {}
  }
  , {
    provider_alias         = "spoke1-sub"
    is_applicable          = true
    resource_group_name    = "rg-mhra-perf-uks-network"
    virtual_network_name   = "vnet-mhra-perf-uks-h1s01"
    address_prefixes       = ["10.25.30.0/26"]
    name                   = "snet-mhra-perf-uks-h1s01-lgappsubnet"
    allow_private_endpoint = false
    service_endpoints      = []
    delegation_config = {
      "Microsoft.Web.serverFarms" = {
        service_delegation = {
          enabled      = true
          service_name = "Microsoft.Web/serverFarms"
          actions      = ["Microsoft.Network/virtualNetworks/subnets/action"]
        }
      }
    }
  }
  , {
    provider_alias         = "spoke1-sub"
    is_applicable          = true
    resource_group_name    = "rg-mhra-perf-uks-network"
    virtual_network_name   = "vnet-mhra-perf-uks-h1s01"
    address_prefixes       = ["10.25.30.64/26"]
    name                   = "snet-mhra-perf-uks-h1s01-azfuncsubnet"
    allow_private_endpoint = false
    service_endpoints      = ["Microsoft.Storage"]
    delegation_config = {
      "Microsoft.Web.serverFarms" = {
        service_delegation = {
          enabled      = true
          service_name = "Microsoft.Web/serverFarms"
          actions      = ["Microsoft.Network/virtualNetworks/subnets/action"]
        }
      }
    }
  }
  , {
    provider_alias         = "spoke1-sub"
    is_applicable          = true
    resource_group_name    = "rg-mhra-perf-uks-network"
    virtual_network_name   = "vnet-mhra-perf-uks-h1s01"
    address_prefixes       = ["10.25.128.128/29"]
    name                   = "snet-mhra-perf-uks-h1s01-apimsubnet"
    allow_private_endpoint = false
    service_endpoints      = []
    delegation_config = {
      "Microsoft.Web.serverFarms" = {
        service_delegation = {
          enabled      = true
          service_name = "Microsoft.Web/serverFarms"
          actions      = ["Microsoft.Network/virtualNetworks/subnets/action"]
        }
      }
    }
  }
  , {
    provider_alias         = "spoke1-sub"
    is_applicable          = true
    resource_group_name    = "rg-mhra-perf-uks-network"
    virtual_network_name   = "vnet-mhra-perf-uks-h1s01"
    address_prefixes       = ["10.25.128.0/26"]
    name                   = "snet-mhra-perf-uks-h1s01-appservicessubnet"
    allow_private_endpoint = false
    service_endpoints      = []
    delegation_config = {
      "Microsoft.Web.serverFarms" = {
        service_delegation = {
          enabled      = true
          service_name = "Microsoft.Web/serverFarms"
          actions      = ["Microsoft.Network/virtualNetworks/subnets/action"]
        }
      }
    }
  }
  , {
    provider_alias         = "spoke1-sub"
    is_applicable          = true
    resource_group_name    = "rg-mhra-perf-uks-network"
    virtual_network_name   = "vnet-mhra-perf-uks-h1s01"
    address_prefixes       = ["10.25.129.0/26"]
    name                   = "snet-mhra-perf-uks-h1s01-uksrs-subnet"
    allow_private_endpoint = false
    service_endpoints      = []
    delegation_config = {
      "Microsoft.Web.serverFarms" = {
        service_delegation = {
          enabled      = true
          service_name = "Microsoft.Web/serverFarms"
          actions      = ["Microsoft.Network/virtualNetworks/subnets/action"]
        }
      }
    }
  }
]

#VNet peering details
vnet_peering_config = {
  vnet-mhra-cnct-uks-h1s00_to_vnet-mhra-perf-uks-h1s01 = {
    provider_alias               = "connectivity-sub"
    is_applicable                = true
    local_vnet_name              = "vnet-mhra-cnct-uks-h1s00"
    resource_group_name          = "rg-mhra-cnct-uks-network"
    remote_vnet_name             = "vnet-mhra-perf-uks-h1s01"
    remote_to_local_access_allow = true
    remote_forward_allow         = true
    remote_gw_access_to_local    = true
    local_gw_access_to_remote    = false
  }
  vnet-mhra-perf-uks-h1s01_to_vnet-mhra-cnct-uks-h1s00 = {
    provider_alias               = "spoke1-sub"
    is_applicable                = true
    local_vnet_name              = "vnet-mhra-perf-uks-h1s01"
    resource_group_name          = "rg-mhra-perf-uks-network"
    remote_vnet_name             = "vnet-mhra-cnct-uks-h1s00"
    remote_to_local_access_allow = true
    remote_forward_allow         = true
    remote_gw_access_to_local    = false
    local_gw_access_to_remote    = true
  }
}

# Static IP details
static_ip_address_config = {
  pip-agw-mhra-perf-uks-h1s01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-perf-uks-network"
    allocation_type     = "Static"
    sku                 = "Standard"
    zones               = ["1", "2", "3"]
    tags                = {}
  }
}