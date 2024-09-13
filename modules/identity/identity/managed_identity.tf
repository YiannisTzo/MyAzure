locals {
  user_identities = flatten([ # This is calculating the list of roles that we need to iterate over for the azurerm_role_assignment block so that we can add multiple role assignments for each user_assigned_managed_identities.
    for user, user_info in var.user_assigned_managed_identities : [
      for roles in user_info.permissions : {
        username = user
        scope    = user_info.scope
        role     = roles
      }
    ]
  ])
}

## user assigned managed identity to be used with azure policy assignments for DINE.
resource "azurerm_user_assigned_identity" "subscription_user_assigned_identity" {
  for_each            = var.user_assigned_managed_identities
  name                = each.key
  resource_group_name = each.value.resource_group_name
  location            = var.region
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}

## Role assignment for the user identity created above. 
resource "azurerm_role_assignment" "user_identity_role_assignment" {
  for_each                         = { for user in local.user_identities : "${user.username}/${user.role}" => user }
  principal_id                     = azurerm_user_assigned_identity.subscription_user_assigned_identity[each.value.username].principal_id
  scope                            = each.value.scope
  role_definition_name             = each.value.role
  skip_service_principal_aad_check = true
  depends_on = [
    azurerm_user_assigned_identity.subscription_user_assigned_identity
  ]
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    delete = var.crud_timeouts.delete
  }
}

## Role assignment resources
resource "azurerm_role_assignment" "resource_role_assignment" {
  for_each                         = { for k, v in var.resource_role_config : k => v }
  principal_id                     = each.value.principal_id
  scope                            = each.value.scope
  role_definition_name             = each.value.role
  skip_service_principal_aad_check = true
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    delete = var.crud_timeouts.delete
  }
}
