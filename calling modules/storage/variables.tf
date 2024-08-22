variable "storage_account_config" {}

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
