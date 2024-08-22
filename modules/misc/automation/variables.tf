variable "global_tags" {
  type = map(string)
}

variable "crud_timeouts" {
  type = map(string)
}

variable "azure_tenant_id" {
  type = string
}

variable "region" {
  type = string
}

variable "ref_data" {
  type = object({
    log_analytics_workspace = any
  })
}

variable "laws_linked_service_config" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    resource_group_name = string
    workspace_name      = string
    automation_acc_name = string
  }))
}

variable "automation_accounts_config" {
  type = map(object({
    provider_alias                = string
    is_applicable                 = bool
    resource_group_name           = string
    sku_name                      = string
    public_network_access_enabled = bool
    tags                          = map(string)
  }))
}