variable "global_tags" {
  type = map(string)
}

variable "crud_timeouts" {
  type = map(string)
}

variable "region" {
  type = string
}

variable "nsg_config" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    resource_group_name = string
    tags                = map(string)
    security_rule = list(object({
      name                       = string
      priority                   = string
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
      description                = string
    }))
  }))
}

variable "nsg_subnet_association_config" {
  type = list(object({
    provider_alias              = string
    is_applicable               = bool
    vnet_name                   = string
    subnet_name                 = string
    network_security_group_name = string
  }))
}

variable "ref_data" {
  type = object({
    subnet_data = any
  })
}