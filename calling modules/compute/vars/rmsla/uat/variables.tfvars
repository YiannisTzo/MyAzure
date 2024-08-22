region = "uksouth"

azure_subscription_ids = {
  spoke1-sub   = "07edd6a4-50ef-4f6f-9965-454b6feeaebd"
  identity-sub = "a21b6571-851b-4d37-99f2-0db248599c54"
}

# global tags to be associated with all the resources
global_tags = {
  environment = "UAT"
}

# default crud timeouts
crud_timeouts = {
  create = "30m"
  read   = "5m"
  update = "30m"
  delete = "30m"
}