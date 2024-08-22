output "o_managed_identity" {
  value = {
    spoke1 = module.spoke1_identity.o_managed_identity
  }
}
