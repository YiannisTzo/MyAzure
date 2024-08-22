locals {
  rg_by_provider = {
    for ko, vo in distinct([for ki, vi in var.resource_groups : vi.provider_alias]) : vo => {
      for kii, vii in var.resource_groups : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }
}

module "resourcegroup_spoke1_sub" {
  source          = "../../shared/core/resourcegroup"
  resource_groups = local.rg_by_provider["spoke1-sub"]
  region          = var.region
  global_tags     = var.global_tags
  crud_timeouts   = var.crud_timeouts
  providers = {
    azurerm = azurerm.spoke1-sub
  }
}