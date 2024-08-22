# user assigned managed identities. 
user_assigned_managed_identities = {
  id-mhra-ident-dev-uks-apgw-001 = { # this user is for accessing keyvault secret for app gateway certificate
    provider_alias      = "spoke1-sub"
    is_applicable       = true
    resource_group_name = "rg-mhra-dev-uks-network"
    permissions         = [] # Can add multiple roles if required similar to: = ["Virtual Machine Contributor", "Disk Backup Reader"]
    scope               = ""
    tags                = {}
  }
}
