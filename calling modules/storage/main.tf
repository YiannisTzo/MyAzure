locals {
  stg_acct_by_provider = {
    for ko, vo in distinct([for ki, vi in var.storage_account_config : vi.provider_alias]) : vo => {
      for kii, vii in var.storage_account_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }
}
module "storage_spoke1" {
  source                    = "../../shared/storage/storage"
  storage_account_config    = local.stg_acct_by_provider["spoke1-sub"]
  storage_file_share_config = {}
  region                    = var.region
  global_tags               = var.global_tags
  crud_timeouts             = var.crud_timeouts
  ref_data = {
    subnet_data = data.terraform_remote_state.network_resources.outputs.o_subnets.spoke1
  }
  providers = {
    azurerm = azurerm.spoke1-sub
  }
}
