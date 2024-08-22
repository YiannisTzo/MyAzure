output "o_resource_group" {
  value = {
    spoke1 = module.resourcegroup_spoke1_sub.o_resource_group
  }
}
