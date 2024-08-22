variable "nsg_config" {}

variable "nsg_subnet_association_config" {}

variable "route_tables_config" {}

variable "route_table_subnets_config" {}

variable "azurerm_application_gateway_config" {}

variable "azure_client_id" {
  type      = string
  sensitive = true
}

variable "azure_subscription_ids" {
  type = map(string)
}

variable "azure_tenant_id" {
  type      = string
  sensitive = true
}

variable "azure_client_secret" {
  type      = string
  sensitive = true
}

variable "state_storage_container_name" {
  type      = string
  sensitive = true
}

variable "state_storage_acct_name" {
  type      = string
  sensitive = true
}

variable "tfstate_storage_access_key" {
  type      = string
  sensitive = true
}

variable "environment" {
  type = string
}

variable "region" {
  type = string
}

variable "global_tags" {
  type = map(string)
}

variable "firewall_policy_global_tags" {
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

variable "clientName" {
  type = string
}

variable "hub_environment" {
  type = string
}

# Variables for WAF configuration
variable "azure_app_gway_waf_configuration" {
  default = {}
}