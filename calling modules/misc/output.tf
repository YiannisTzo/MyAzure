output "o_private_endpoint" {
  value = {
    spoke1 = module.private_endpoint_development.o_private_endpoint
  }
}