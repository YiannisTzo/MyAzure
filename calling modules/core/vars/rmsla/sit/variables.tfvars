region = "uksouth"

azure_subscription_ids = {
  spoke1-sub   = "afc6d07d-3eac-4228-b97f-e2c24b08b8bc"
  identity-sub = "a21b6571-851b-4d37-99f2-0db248599c54"
}

# global tags to be associated with all the resources
global_tags = {
  costcentre   = "tbc"
  environment  = "SIT"
  projectcode  = "tbc"
  owner        = "Platform"
  application  = "Platform"
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