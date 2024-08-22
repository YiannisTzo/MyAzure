terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "=3.21.0" # cannot increase until terraform-provider-azurerm/issues/16942 has been resolved.
      configuration_aliases = [azurerm.spoke1-sub, azurerm.connectivity-sub]
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

provider "azurerm" {
  features {
  }
  alias           = "connectivity-sub"
  subscription_id = var.azure_subscription_ids["connectivity-sub"]
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