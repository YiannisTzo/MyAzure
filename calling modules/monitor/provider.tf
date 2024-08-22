terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "=3.5.0" # cannot increase until terraform-provider-azurerm/issues/16942 has been resolved.
      configuration_aliases = [azurerm.spoke1-sub]
    }
  }
  backend "azurerm" {
  }
}

provider "azurerm" {
  features {
  }
  subscription_id = var.azure_subscription_ids["spoke1-sub"]
  tenant_id       = var.azure_tenant_id
  client_secret   = var.azure_client_secret
  client_id       = var.azure_client_id
}

provider "azurerm" {
  features {
  }
  alias           = "spoke1-sub"
  subscription_id = var.azure_subscription_ids["spoke1-sub"]
  tenant_id       = var.azure_tenant_id
  client_secret   = var.azure_client_secret
  client_id       = var.azure_client_id
}

data "terraform_remote_state" "network_resources" {
  backend = "azurerm"
  config = {
    container_name       = var.state_storage_container_name
    storage_account_name = var.state_storage_acct_name
    access_key           = var.tfstate_storage_access_key
    key                  = "eslzspoke/${var.clientName}/${var.environment}/network/project.tfstate"
  }
}

data "terraform_remote_state" "storage_resources" {
  backend = "azurerm"
  config = {
    container_name       = var.state_storage_container_name
    storage_account_name = var.state_storage_acct_name
    access_key           = var.tfstate_storage_access_key
    key                  = "eslzspoke/${var.clientName}/${var.environment}/storage/project.tfstate"
  }
}

#To access storage data from hub subscription to be used as the diagnostic logging destination
data "terraform_remote_state" "hub_storage_resources" {
  backend = "azurerm"
  config = {
    container_name       = var.state_storage_container_name
    storage_account_name = var.state_storage_acct_name
    access_key           = var.tfstate_storage_access_key
    key                  = "eslz/${var.hub_environment}/storage/project.tfstate"
  }
}

data "terraform_remote_state" "security_resources" {
  backend = "azurerm"
  config = {
    container_name       = var.state_storage_container_name
    storage_account_name = var.state_storage_acct_name
    access_key           = var.tfstate_storage_access_key
    key                  = "eslzspoke/${var.clientName}/${var.environment}/security/project.tfstate"
  }
}

# to obtain details of hub log analytics workspace
data "terraform_remote_state" "monitoring_resources" {
  backend = "azurerm"
  config = {
    container_name       = var.state_storage_container_name
    storage_account_name = var.state_storage_acct_name
    access_key           = var.tfstate_storage_access_key
    key                  = "eslz/${var.hub_environment}/monitor/project.tfstate"
  }
}

data "terraform_remote_state" "network_routing_resources" {
  backend = "azurerm"
  config = {
    container_name       = var.state_storage_container_name
    storage_account_name = var.state_storage_acct_name
    access_key           = var.tfstate_storage_access_key
    key                  = "eslzspoke/${var.clientName}/${var.environment}/network-routing/project.tfstate"
  }
}