locals {
  kv_by_provider = {
    for ko, vo in distinct([for ki, vi in var.key_vaults : vi.provider_alias]) : vo => {
      for kii, vii in var.key_vaults : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }

  access_policy_by_provider = {
    for ko, vo in distinct([for ki, vi in var.kv_access_policies : vi.provider_alias]) : vo => {
      for kii, vii in var.kv_access_policies : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }
}

module "keyvault_spoke1" {
  source          = "../../shared/security/keyvault"
  key_vaults      = local.kv_by_provider["spoke1-sub"]
  access_policies = lookup(local.access_policy_by_provider, "spoke1-sub", {})
  region          = var.region
  global_tags     = var.global_tags
  crud_timeouts   = var.crud_timeouts
  azure_tenant_id = var.azure_tenant_id
  providers = {
    azurerm = azurerm.spoke1-sub
  }

  ref_data = {
    subnet_data           = data.terraform_remote_state.network_resources.outputs.o_subnets.spoke1
    managed_identity_data = data.terraform_remote_state.identity_resources.outputs.o_managed_identity.spoke1
  }
}
