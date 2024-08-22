region = "uksouth"

azure_subscription_ids = {
  spoke1-sub = "afc6d07d-3eac-4228-b97f-e2c24b08b8bc"
}

# global tags to be associated with all the resources
global_tags = {
  costcentre   = "tbc"
  environment  = "SIT"
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
