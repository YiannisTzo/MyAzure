output "o_recovery_svc_vaults" {
  value = {
    for k, v in azurerm_recovery_services_vault.vm_service_vault : v.name => { id = v.id
      identity = [
        for vid in v.identity : { principal_id = vid.principal_id }
      ]
    }
  }
}