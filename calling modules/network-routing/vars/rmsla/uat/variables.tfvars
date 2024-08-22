region = "uksouth"

azure_subscription_ids = {
  spoke1-sub       = "07edd6a4-50ef-4f6f-9965-454b6feeaebd"
  connectivity-sub = "eb20d232-22b9-4915-9b81-6bbe3bb7344a"
}

# global tags to be associated with all the resources
global_tags = {
}

# global tags for firewall policy
# firewall policy requires all tags to be in small-case hence creating this separate variable
firewall_policy_global_tags = {
}

# default crud timeouts
crud_timeouts = {
  create = "30m"
  read   = "5m"
  update = "30m"
  delete = "30m"
}