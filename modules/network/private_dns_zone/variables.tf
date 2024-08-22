variable "private_dns_zone_config" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    resource_group_name = string
    soa_record = object({
      use_soa_record  = bool
      email           = string
      expire_time     = string
      minimum_ttl     = string
      refresh_time    = string
      retry_time      = string
      ttl             = string
      soa_record_tags = map(string)
    })
    tags = map(string)
  }))
}

variable "private_dns_zone_vnet_link_config" {
  type = map(object({
    provider_alias        = string
    is_applicable         = bool
    resource_group_name   = string
    private_dns_zone_name = string
    virtual_network_name  = string
    registration_enabled  = bool
    tags                  = map(string)
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
    remote_vnet_resources = any
  })
}