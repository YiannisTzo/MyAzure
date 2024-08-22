region = "uksouth"

azure_subscription_ids = {
  spoke1-sub = "07edd6a4-50ef-4f6f-9965-454b6feeaebd"
}

# global tags to be associated with all the resources
global_tags = {
  costcentre   = "tbc"
  environment  = "UAT"
  projectcode  = "tbc"
  owner        = "tbc"
  application  = "tbc"
  datatype     = "tbc"
  creationdate = "tbc"
  createdby    = "tbc"
  role         = "tbc"
  name         = "tbc"
  hostname     = "tbc"
}

# default crud timeouts
crud_timeouts = {
  create = "30m"
  read   = "5m"
  update = "30m"
  delete = "30m"
}
