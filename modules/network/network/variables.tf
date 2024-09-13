variable "virtual_networks" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    address_space       = list(string)
    resource_group_name = string
    tags                = map(string)
    ddos_config = object({
      name     = string
      use_ddos = bool
    })
    dns_servers = list(string)
  }))
}

variable "subnet_config" {
  type = list(object({
    name                   = string
    address_prefixes       = list(string)
    provider_alias         = string
    is_applicable          = string
    resource_group_name    = string
    virtual_network_name   = string
    allow_private_endpoint = optional(bool, false)  # Optional boolean with default false
    service_endpoints      = list(string)
    delegation_config = map(object({
      service_delegation = object({
        enabled      = bool
        service_name = string
        actions      = list(string)
      })
    }))
  }))
}

variable "region" {
  type = string
}

variable "global_tags" {
  type = map(string)
}

variable "crud_timeouts" {
  type = map(string)
}

variable "ref_data" {
  type = object({
    ddos_resources        = any
    remote_vnet_resources = any
  })
}

variable "vnet_peering_config" {
  type = map(object({
    provider_alias               = string
    is_applicable                = bool
    local_vnet_name              = string
    remote_vnet_name             = string
    resource_group_name          = string
    remote_to_local_access_allow = bool
    remote_forward_allow         = bool
    remote_gw_access_to_local    = bool
    local_gw_access_to_remote    = bool
  }))
}

variable "static_ip_address_config" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    resource_group_name = string
    allocation_type     = string
    sku                 = string
    zones               = list(string)
    domain_name_label   = optional(string)
    tags                = map(string)
  }))
}
