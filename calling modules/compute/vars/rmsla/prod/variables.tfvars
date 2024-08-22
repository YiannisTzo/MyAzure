region = "uksouth"

azure_subscription_ids = {
  spoke1-sub   = "8d0637ea-351c-4d4f-befd-f63f585f0d40"
  identity-sub = "a21b6571-851b-4d37-99f2-0db248599c54"
}

# global tags to be associated with all the resources
global_tags = {
  environment = "PROD"
}

# default crud timeouts
crud_timeouts = {
  create = "30m"
  read   = "5m"
  update = "30m"
  delete = "30m"
}