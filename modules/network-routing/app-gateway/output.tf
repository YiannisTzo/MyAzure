output "o_app_gw" {
  value = {
    for k, v in azurerm_application_gateway.app_gateway : k => {
      id   = v.id
      name = v.name
    }
  }
}