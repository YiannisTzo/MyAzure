locals {
  user_assigned_managed_identity_by_provider = {
    for ko, vo in distinct([for ki, vi in var.user_assigned_managed_identities : vi.provider_alias]) : vo => {
      for kii, vii in var.user_assigned_managed_identities : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }
}

module "spoke1_identity" {
  source                           = "../../shared/identity/identity"
  user_assigned_managed_identities = local.user_assigned_managed_identity_by_provider["spoke1-sub"]
  region                           = var.region
  global_tags                      = var.global_tags
  crud_timeouts                    = var.crud_timeouts
}
