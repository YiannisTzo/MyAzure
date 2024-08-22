#Resource group module for spoke client

resource_groups = {
  rg-mhra-prod-uks-network = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-prod-uks-rms = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-prod-uks-la = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-prod-uks-backup = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-prod-uks-monitoring = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-prod-uks-rms-ectd = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-prod-uks-rc-reporting = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }
}
