#Create a resource group
resource "azurerm_resource_group" "resource_group" {
  for_each = var.resource_groups
  name     = each.key
  location = var.region
  tags = merge(
    var.global_tags, each.value.resource_group_tags
  )
  timeouts {
    create = var.crud_timeouts.create
    read   = var.crud_timeouts.read
    update = var.crud_timeouts.update
    delete = var.crud_timeouts.delete
  }
}