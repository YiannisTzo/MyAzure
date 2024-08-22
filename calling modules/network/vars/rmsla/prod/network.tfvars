# Network module

# virtual network details
virtual_networks = {
  vnet-mhra-prod-uks-h1s01 = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    address_space  = ["10.18.0.0/16"]
    tags = {
    }
    resource_group_name = "rg-mhra-prod-uks-network"

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
    resource_group_name    = "rg-mhra-prod-uks-network"
    virtual_network_name   = "vnet-mhra-prod-uks-h1s01"
    address_prefixes       = ["10.18.10.0/24"]
    name                   = "snet-mhra-prod-uks-h1s01-waf"
    allow_private_endpoint = false
    service_endpoints      = ["Microsoft.KeyVault", "Microsoft.Storage"]
    delegation_config      = {}
  }
  , {
    provider_alias         = "spoke1-sub"
    is_applicable          = true
    resource_group_name    = "rg-mhra-prod-uks-network"
    virtual_network_name   = "vnet-mhra-prod-uks-h1s01"
    address_prefixes       = ["10.18.12.0/22"]
    name                   = "snet-mhra-prod-uks-h1s01-presentation"
    allow_private_endpoint = true
    service_endpoints      = ["Microsoft.Storage"]
    delegation_config      = {}
  }
  , {
    provider_alias         = "spoke1-sub"
    is_applicable          = true
    resource_group_name    = "rg-mhra-prod-uks-network"
    virtual_network_name   = "vnet-mhra-prod-uks-h1s01"
    address_prefixes       = ["10.18.16.0/22"]
    name                   = "snet-mhra-prod-uks-h1s01-app"
    allow_private_endpoint = true
    service_endpoints      = ["Microsoft.Storage"]
    delegation_config      = {}
  }
  , {
    provider_alias         = "spoke1-sub"
    is_applicable          = true
    resource_group_name    = "rg-mhra-prod-uks-network"
    virtual_network_name   = "vnet-mhra-prod-uks-h1s01"
    address_prefixes       = ["10.18.20.0/22"]
    name                   = "snet-mhra-prod-uks-h1s01-data"
    allow_private_endpoint = true
    service_endpoints      = ["Microsoft.Storage"]
    delegation_config      = {}
  }
  , {
    provider_alias         = "spoke1-sub"
    is_applicable          = true
    resource_group_name    = "rg-mhra-prod-uks-network"
    virtual_network_name   = "vnet-mhra-prod-uks-h1s01"
    address_prefixes       = ["10.18.30.0/26"]
    name                   = "snet-mhra-prod-uks-h1s01-lgappsubnet"
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
    resource_group_name    = "rg-mhra-prod-uks-network"
    virtual_network_name   = "vnet-mhra-prod-uks-h1s01"
    address_prefixes       = ["10.18.30.64/26"]
    name                   = "snet-mhra-prod-uks-h1s01-azfuncsubnet"
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
    resource_group_name    = "rg-mhra-prod-uks-network"
    virtual_network_name   = "vnet-mhra-prod-uks-h1s01"
    address_prefixes       = ["10.18.128.0/26"]
    name                   = "snet-mhra-prod-uks-h1s01-appservicessubnet"
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
    resource_group_name    = "rg-mhra-prod-uks-network"
    virtual_network_name   = "vnet-mhra-prod-uks-h1s01"
    address_prefixes       = ["10.18.129.0/26"]
    name                   = "snet-mhra-prod-uks-h1s01-uksrs-subnet"
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
    resource_group_name    = "rg-mhra-prod-uks-network"
    virtual_network_name   = "vnet-mhra-prod-uks-h1s01"
    address_prefixes       = ["10.18.128.128/29"]
    name                   = "snet-mhra-prod-uks-h1s01-apimsubnet"
    allow_private_endpoint = false
    service_endpoints      = []
    delegation_config = {}
  }
  , {
    provider_alias         = "spoke1-sub"
    is_applicable          = true
    resource_group_name    = "rg-mhra-prod-uks-network"
    virtual_network_name   = "vnet-mhra-prod-uks-h1s01"
    address_prefixes       = ["10.18.128.192/27"]
    name                   = "snet-mhra-prod-uks-h1s01-redis"
    allow_private_endpoint = true
    service_endpoints      = []
    service_endpoints      = []
    delegation_config      = {}
  }
]

#VNet peering details
vnet_peering_config = {
  vnet-mhra-cnct-uks-h1s00_to_vnet-mhra-prod-uks-h1s01 = {
    provider_alias               = "connectivity-sub"
    is_applicable                = true
    local_vnet_name              = "vnet-mhra-cnct-uks-h1s00"
    resource_group_name          = "rg-mhra-cnct-uks-network"
    remote_vnet_name             = "vnet-mhra-prod-uks-h1s01"
    remote_to_local_access_allow = true
    remote_forward_allow         = true
    remote_gw_access_to_local    = true
    local_gw_access_to_remote    = false
  }
  vnet-mhra-prod-uks-h1s01_to_vnet-mhra-cnct-uks-h1s00 = {
    provider_alias               = "spoke1-sub"
    is_applicable                = true
    local_vnet_name              = "vnet-mhra-prod-uks-h1s01"
    resource_group_name          = "rg-mhra-prod-uks-network"
    remote_vnet_name             = "vnet-mhra-cnct-uks-h1s00"
    remote_to_local_access_allow = true
    remote_forward_allow         = true
    remote_gw_access_to_local    = false
    local_gw_access_to_remote    = true
  }
}

# Static IP details
static_ip_address_config = {
  pip-agw-mhra-prod-uks-h1s01 = {
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-prod-uks-network"
    allocation_type     = "Static"
    sku                 = "Standard"
    zones               = ["1", "2", "3"]
    tags                = {}
  }
}
