variable "firewall_config" {
  type = map(object({
    provider_alias       = string
    is_applicable        = bool
    resource_group_name  = string
    sku_name             = string
    sku_tier             = string
    firewall_policy_name = string
    zones                = list(string)

    tags = map(string)
    ip_config = object({
      vnet_name              = string
      subnet_name            = string
      static_ip_address_name = string
    })
    crud_timeouts = object({
      create = string
      read   = string
      update = string
      delete = string
    })
    management_ip_configuration = object({
      is_applicable          = bool
      name                   = string
      subnet_name            = string
      vnet_name              = string
      static_ip_address_name = string
    })
  }))
}

variable "firewall_policy_config" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    resource_group_name = string
    sku                 = string
    private_ip_ranges   = list(string)
    intrusion_detection = object({
      mode = string
    })

    tags = map(string)

    dns_config = object({
      is_applicable = bool
      proxy_enabled = bool
      servers       = list(string)
    })

    threat_intelligence_allowlist_config = object({
      is_applicable = bool
      fqdns         = list(string)
      ip_addresses  = list(string)
    })

    threat_intelligence_mode = string
  }))
}

variable "firewall_policy_rule_collection_group_config" {
  type = map(object({
    provider_alias       = string
    is_applicable        = bool
    firewall_policy_name = string
    priority             = string
    network_rule_collection = map(object({
      priority = string
      action   = string
      rule = map(object({
        protocols             = list(string)
        source_addresses      = list(string)
        destination_addresses = list(string)
        destination_ports     = list(string)
        destination_fqdns     = list(string)
        destination_ip_groups = list(string)
        source_ip_groups      = list(string)
      }))
    }))

    application_rule_collection = map(object({
      priority = string
      action   = string
      rule = map(object({
        protocols = list(object({
          port = number
          type = string
        }))
        source_addresses      = list(string)
        source_ip_groups      = list(string)
        web_categories        = list(string)
        destination_fqdns     = list(string)
        destination_addresses = list(string)
        destination_fqdn_tags = list(string)
        destination_urls      = list(string)
        terminate_tls         = bool
      }))
    }))
  }))
}

variable "global_tags" {
  type = map(string)
}

variable "firewall_policy_global_tags" {
  type = map(string)
}

variable "crud_timeouts" {
  type = map(string)
}

variable "region" {
  type = string
}

variable "ref_data" {
  type = object({
    subnet_data    = any
    static_ip_data = any
  })
}