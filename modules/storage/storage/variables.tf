variable "storage_account_config" {
  type = map(object({
    provider_alias                  = string
    is_applicable                   = bool
    resource_group_name             = string
    account_tier                    = string
    account_replication_type        = string
    access_tier                     = string
    account_kind                    = string
    public_network_access_enabled   = bool
    allow_nested_items_to_be_public = bool
    network_rules = object({
      enforce_network_rules         = bool
      whitelist_public_ips_or_cidrs = list(string)
      bypass_traffic                = list(string)
      virtual_network_subnet_ids    = optional(list(string))
      # TODO with current implementation, subnets defined under subscriptions different than that of the storage account 
      # can not be configured in the network rules
      subnets_config = map(list(string))
      private_link_access_config = list(object({
        endpoint_resource_id = string
        endpoint_tenant_id   = string
      }))
    })
    tags = map(string)
    hierarchical_namespace_enabled = bool

    azure_files_authentication = optional(object({
      directory_type   = string
      active_directory = optional(object({
        domain_name         = string
        domain_guid         = string
        domain_sid          = optional(string)
        storage_sid         = optional(string)
        forest_name         = optional(string)
        netbios_domain_name = optional(string)
      }))
    }))
  }))
}

variable "storage_file_share_config" {
  type = map(object({
    provider_alias       = string
    is_applicable        = bool
    resource_group_name  = string
    storage_account_name = string
    quota                = number
    access_tier          = string
    enabled_protocol     = string
    access_policy        = any
  }))
}

variable "global_tags" {
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
    subnet_data = any
  })
}
