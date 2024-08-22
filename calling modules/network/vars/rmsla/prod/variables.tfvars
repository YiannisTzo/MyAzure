region = "uksouth"

azure_subscription_ids = {
  spoke1-sub       = "8d0637ea-351c-4d4f-befd-f63f585f0d40"
  connectivity-sub = "eb20d232-22b9-4915-9b81-6bbe3bb7344a"
}

# global tags to be associated with all the resources
global_tags = {
  costcentre   = "tbc"
  environment  = "PROD"
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
