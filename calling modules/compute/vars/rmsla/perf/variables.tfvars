region = "uksouth"

azure_subscription_ids = {
  spoke1-sub   = "356add7c-0957-4151-8d54-39364331a524"
  identity-sub = "a21b6571-851b-4d37-99f2-0db248599c54"
}

# global tags to be associated with all the resources
global_tags = {
  environment = "PERF"
}

# default crud timeouts
crud_timeouts = {
  create = "30m"
  read   = "5m"
  update = "30m"
  delete = "30m"
}