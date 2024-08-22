output "o_recovery_svc_vaults" {
  value = {
    spoke1 = module.virtual_machines_development.o_recovery_svc_vaults
  }
}