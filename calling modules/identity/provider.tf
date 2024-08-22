terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "=3.5.0" # cannot increase until terraform-provider-azurerm/issues/16942 has been resolved.
      configuration_aliases = [azurerm.spoke1-sub]
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "=2.28.0"
    }
  }
  backend "azurerm" {
  }
}

provider "azuread" {
  tenant_id     = var.azure_tenant_id
  client_id     = var.azure_client_id
  client_secret = var.azure_client_secret
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
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
  alias           = "spoke1-sub"
  subscription_id = var.azure_subscription_ids["spoke1-sub"]
  tenant_id       = var.azure_tenant_id
  client_secret   = var.azure_client_secret
  client_id       = var.azure_client_id
}
