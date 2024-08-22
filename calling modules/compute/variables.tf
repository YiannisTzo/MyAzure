variable "managed_disk_config" {}

variable "managed_disk_attachment_config" {}

variable "azurerm_virtual_machine_extension_config" {}

variable "azurerm_recovery_services_vault_config" {}

variable "azurerm_backup_policy_vm_config" {}

variable "azurerm_backup_protected_vm_config" {}

variable "vm_network_interface_config" {}

variable "vm_config" {}

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

variable "azure_tenant_id" {
  type      = string
  sensitive = true
}

variable "azure_client_id" {
  type      = string
  sensitive = true
}

variable "azure_subscription_ids" {
  type = map(string)
}

variable "azure_client_secret" {
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

variable "vm_admin_pwd" {
  type      = string
  sensitive = true
}

variable "resource_role_config" {}

variable "clientName" {
  type = string
}
variable "hub_environment" {
  type = string
}