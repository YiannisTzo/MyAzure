
variable "global_tags" {
  type = map(string)
}

variable "crud_timeouts" {
  type = map(string)
}

variable "region" {
  type = string
}

variable "route_tables_config" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    resource_group_name = string
    tags                = map(string)

    bgp_route_propagation_enabled = bool

    routing_rules = list(object({
      rule_name            = string
      cidr                 = string
      route_target_type    = string
      route_target_address = string
      route_target_name    = string
      is_applicable        = bool
    }))
  }))
}

variable "route_table_subnets_config" {
  type = list(object({
    provider_alias   = string
    is_applicable    = bool
    vnet_name        = string
    subnet_name      = string
    route_table_name = string
  }))
}

variable "ref_data" {
  type = object({
    subnet_data = any
    vappliances = any
  })
}