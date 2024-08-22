output "o_managed_identity" {
  value = {
    for k, v in azurerm_user_assigned_identity.subscription_user_assigned_identity : k => {
      id           = v.id
      principal_id = v.principal_id
      tenant_id    = v.tenant_id
    }
  }
}
