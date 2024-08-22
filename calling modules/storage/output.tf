output "o_storage_accounts" {
  value = {
    for k, v in merge(module.storage_spoke1.o_storage_accounts) : k => {
      id   = v.id
      name = v.name
    }
  }
}
