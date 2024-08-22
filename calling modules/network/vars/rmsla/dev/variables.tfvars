region = "uksouth"

azure_subscription_ids = {
  spoke1-sub       = "0c69e674-9156-45be-abfa-baf73b4b5ede"
  connectivity-sub = "eb20d232-22b9-4915-9b81-6bbe3bb7344a"
}

# global tags to be associated with all the resources
global_tags = {
  costcentre   = "tbc"
  environment  = "DEV"
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
