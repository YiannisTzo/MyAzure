locals {

  private_endpoint_config_by_provider = {
    for ko, vo in distinct([for ki, vi in var.private_endpoint_config : vi.provider_alias]) : vo => {
      for kii, vii in var.private_endpoint_config : kii => vii if vo == vii.provider_alias && vii.is_applicable
    }
  }

}

module "private_endpoint_development" {
  source                  = "../../shared/misc/private-endpoint"
  private_endpoint_config = local.private_endpoint_config_by_provider["spoke1-sub"]
  azure_tenant_id         = var.azure_tenant_id
  region                  = var.region
  global_tags             = var.global_tags
  crud_timeouts           = var.crud_timeouts
  providers = {
    azurerm = azurerm.spoke1-sub
  }

  ref_data = {
    subnet_data           = data.terraform_remote_state.network_resources.outputs.o_subnets.spoke1
    storage_acc_data      = data.terraform_remote_state.storage_resources.outputs.o_storage_accounts
    keyvault_data         = data.terraform_remote_state.security_resources.outputs.o_key_vaults.spoke1
    rec_svc_vault_data    = data.terraform_remote_state.compute_resources.outputs.o_recovery_svc_vaults.spoke1
    data_factory_data     = var.data_factory_config
    batch_accounts_data   = var.batch_account_config
    private_dns_zone_data = data.terraform_remote_state.hub_network_resources.outputs.o_private_dns_zone.connectivity
  }
}
