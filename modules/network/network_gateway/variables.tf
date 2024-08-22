variable "express_route_gateway_config" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    resource_group_name = string
    tags                = map(string)

    gateway_type         = string
    enable_active_active = bool
    enable_bgp           = bool
    sku_code             = string

    ip_config = map(object({
      vnet_name                  = string
      subnet_name                = string
      private_ip_allocation_type = string
      static_ip_address_name     = string
    }))

    gateway_generation = string
    enable_private_ip  = bool

    crud_timeouts = object({
      create = string
      read   = string
      update = string
      delete = string
    })
  }))
}

variable "region" {
  type = string
}

variable "global_tags" {
  type = map(string)
}

variable "crud_timeouts" {
  type = object({
    create = string
    read   = string
    update = string
    delete = string
  })
}

variable "ref_data" {
  type = object({
    subnet_data         = any
    static_ip_data      = any
    ergw_conn_auth_keys = any
  })
}

variable "site_to_site_gateway_connection_config" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    resource_group_name = string

    connection_type = string
    vnet_gw_name    = string
    shared_key      = string

    express_route_circuit_id = string
    authorization_key        = string

    tags = map(string)

    dpd_timeout_seconds = number
    enable_bgp          = bool

    connection_protocol = string

    ipsec_policy_config = object({
      is_applicable    = bool
      dh_group         = string
      ike_encryption   = string
      ike_integrity    = string
      ipsec_encryption = string
      ipsec_integrity  = string
      pfs_group        = string
      sa_datasize      = number
      sa_lifetime      = number
    })

    custom_bgp_addresses = object({
      is_applicable                = bool
      primary_vnet_gw_ip_address   = string
      secondary_vnet_gw_ip_address = string
    })

    local_azure_ip_address_enabled = bool
  }))
}
