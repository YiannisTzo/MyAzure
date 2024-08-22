variable "key_vaults" {
  type = map(object({
    provider_alias                  = string
    is_applicable                   = bool
    resource_group_name             = string
    enabled_for_disk_encryption     = bool
    enabled_for_deployment          = bool
    enabled_for_template_deployment = bool
    soft_delete_retention_days      = number
    purge_protection_enabled        = bool
    sku_name                        = string
    public_network_access_enabled   = bool
    network_acls = object({
      enforce_network_rules         = bool
      bypass                        = string
      whitelist_public_ips_or_cidrs = list(string)
      # TODO with current implementation, subnets defined under subscriptions different than that of the key vault 
      # can not be configured in the network rules
      subnets_config = map(list(string))
    })
    tags = map(string)
  }))
}

variable "access_policies" {
  type = map(object({
    provider_alias = string
    is_applicable  = bool
    key_vault_name = string
    application_id = string
    object_id      = string
    object_id_config = object({
      resource_type = string # it can be uami, sami, sp
      name          = string
    })
    key_permissions         = list(string)
    secret_permissions      = list(string)
    certificate_permissions = list(string)
    storage_permissions     = list(string)
  }))
}

variable "azure_tenant_id" {
  type = string
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
    subnet_data           = any
    managed_identity_data = any
  })
}
