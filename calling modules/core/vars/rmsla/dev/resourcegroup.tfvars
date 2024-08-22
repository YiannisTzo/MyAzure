#Resource group module for spoke client

# Resource group details 
# key: resource group name
# value: provider_name (subscription), tags
resource_groups = {
  rg-mhra-dev-uks-network = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-dev-uks-rms = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-dev-uks-la = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-dev-uks-backup = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-dev-uks-monitoring = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

rg-mhra-dev-uks-rms-ectd = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

rg-mhra-dev-uks-openai = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-dev-uks-rc-reporting = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }
}
