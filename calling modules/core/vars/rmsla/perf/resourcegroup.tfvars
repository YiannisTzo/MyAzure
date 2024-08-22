#Resource group module for spoke client

resource_groups = {
  rg-mhra-perf-uks-network = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-perf-uks-rms = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-perf-uks-la = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-perf-uks-backup = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-perf-uks-monitoring = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-perf-uks-rms-ectd = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-perf-uks-b2c = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-perf-uks-rms-cms = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-perf-uks-tf = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }

  rg-mhra-perf-uks-rms-uksrs = {
    provider_alias = "spoke1-sub"
    is_applicable  = true
    resource_group_tags = {
    }
  }
}
