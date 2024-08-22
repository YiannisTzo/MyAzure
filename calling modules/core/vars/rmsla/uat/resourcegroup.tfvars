#Resource group module for spoke client

resource_groups = {
  rg-mhra-uat-uks-network = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-uat-uks-rms = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-uat-uks-la = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-uat-uks-backup = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-uat-uks-monitoring = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-uat-uks-rms-ectd = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-uat-uks-rc-reporting = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }
}
