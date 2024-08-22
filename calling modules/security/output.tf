output "o_key_vaults" {
  value = {
    spoke1 = module.keyvault_spoke1.o_key_vaults
  }
}
