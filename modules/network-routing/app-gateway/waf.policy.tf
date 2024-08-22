resource "azurerm_web_application_firewall_policy" "firewall_policy" {
  for_each                          = var.azure_app_gway_waf_configuration
  name                              = each.value.name
  resource_group_name               = each.value.resource_group_name
  location                          = each.value.location
  tags                              = try(each.value.tags, null)

  dynamic "custom_rules" {
    for_each = try(each.value.custom_rules, [])
        content {
            enabled                        = try(custom_rules.value.enabled, null)
            name                           = try(custom_rules.value.name, null)
            priority                       = custom_rules.value.priority
            rule_type                      = custom_rules.value.rule_type
            action                         = custom_rules.value.action
            rate_limit_duration            = try(custom_rules.value.rate_limit_duration, null)
            rate_limit_threshold           = try(custom_rules.value.rate_limit_threshold, null)
            group_rate_limit_by            = try(custom_rules.value.group_rate_limit_by, null)


            dynamic "match_conditions" {
                for_each = try(custom_rules.value.match_conditions, [])

                content {
                match_values       = try(match_conditions.value.match_values, null)
                operator           = match_conditions.value.operator
                negation_condition = try(match_conditions.value.negation_condition, null)
                transforms         = try(match_conditions.value.transforms, null)

                dynamic "match_variables" {
                    for_each = try(match_conditions.value.match_variables, [])

                    content {
                        variable_name = match_variables.value.variable_name
                        selector      = try(match_variables.value.selector,null)
                    }
                }
                }
            }
        }
  }

  dynamic "policy_settings" {
    for_each = try(each.value.policy_settings,[])
    content {
        enabled                             = try(policy_settings.value.enabled,null)
        mode                                = try(policy_settings.value.mode,null)
        file_upload_limit_in_mb             = try(policy_settings.value.file_upload_limit_in_mb,null)
        request_body_check                  = try(policy_settings.value.request_body_check,null)
        max_request_body_size_in_kb         = try(policy_settings.value.max_request_body_size_in_kb,null)
        request_body_inspect_limit_in_kb    = try(policy_settings.value.request_body_inspect_limit_in_kb,null)

        dynamic "log_scrubbing" {
            for_each = try(policy_settings.value.log_scrubbing,[])

            content {
                enabled      = try(log_scrubbing.value.enabled,null)
            }
        } 
    }
  }


   dynamic "managed_rules" {
    for_each = try(each.value.managed_rules,[])

    content {
        dynamic "managed_rule_set" {
            for_each = try(managed_rules.value.managed_rule_set,[])

            content {
                type                = try(managed_rule_set.value.type,null)
                version             = managed_rule_set.value.version
                
                dynamic "rule_group_override" {
                    for_each = try(managed_rule_set.value.rule_group_override,[])
                    
                    content {
                        rule_group_name = rule_group_override.value.rule_group_name
                        
                        dynamic "rule" {
                            for_each = try(managed_rule_set.value.rule_group_override,[])
                            content {
                                id          = rule.value.id
                                enabled     = try(rule.value.enabled,null)
                                action      = try(rule.value.action,null)
                            }
                        } 
                    }
                }
            }
        }

        dynamic "exclusion" {
            for_each = try(managed_rules.value.exclusion,[])

            content {
                match_variable          = exclusion.value.match_variable
                selector                = exclusion.value.selector
                selector_match_operator = exclusion.value.selector_match_operator

                dynamic "excluded_rule_set" {
                    for_each = try(exclusion.value.excluded_rule_set,[])
                    
                    content {
                        type        = try(excluded_rule_set.value.type,null)
                        version     = try(excluded_rule_set.value.version,null) 
                        
                        dynamic "rule_group" {
                            for_each = try(excluded_rule_set.value.rule_group,[])
                            
                            content {
                                rule_group_name = rule_group.value.rule_group_name
                                excluded_rules  = try(excluded_rule_set.value.version,null) 
                            }
                        }
                    }
                }
            }
        }
    }
   }
}
