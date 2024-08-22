#Resource group module for spoke client

resource_groups = {
  rg-mhra-sit-uks-network = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-sit-uks-rms = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-sit-uks-la = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-sit-uks-backup = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-sit-uks-monitoring = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-sit-uks-rms-ectd = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-sit-uks-b2c = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-sit-uks-rms-cms = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-sit-uks-tf = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-sit-uks-rms-uksrs = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }
}
