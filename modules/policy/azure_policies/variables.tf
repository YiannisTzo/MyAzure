variable "location" {
  description = "location where your resource needs to be provisioned in azure"
  default     = "uksouth"
}

variable "azure_custom_policy_definition" {
  type = map(object({
    provider_alias        = string
    is_applicable         = bool
    policy_type           = string
    mode                  = string
    display_name          = string
    description           = string
    metadata              = any
    parameters            = any
    policy_rule           = any
    management_group_name = string
  }))
}

variable "azure_custom_policy_assignment" {
  type = map(object({
    provider_alias         = string
    is_applicable          = bool
    not_scopes             = list(string)
    scope                  = string
    description            = string
    display_name           = string
    enforcement_mode       = bool
    policy_definition_name = string
  }))
}

variable "azure_policy_assignment" {
  type = map(object({
    provider_alias       = string
    is_applicable        = bool
    scope                = string
    not_scopes           = list(string)
    policy_definition_id = string
    description          = string
    display_name         = string
    enforcement_mode     = bool
  }))
}

variable "azure_policy_management_group_assignment" {
  type = map(object({
    provider_alias = string
    #management_group_name = string
    scope                = string
    not_scopes           = list(string)
    is_applicable        = bool
    policy_definition_id = string
    description          = string
    display_name         = string
    enforcement_mode     = bool
  }))
}

variable "azure_custom_policy_management_group_assignment" {
  type = map(object({
    provider_alias = string
    #management_group_name  = string
    scope                  = string
    not_scopes             = list(string)
    is_applicable          = bool
    policy_definition_name = string
    description            = string
    display_name           = string
    enforcement_mode       = bool
  }))
}

variable "subscription_level_lock" {
  type = map(object({
    provider_alias = string
    is_applicable  = bool
    scope          = string
    lock_level     = string
    notes          = string
  }))
}

variable "custom_policy_set_definition_config" {
  type = map(object({
    provider_alias        = string
    is_applicable         = bool
    policy_type           = string
    display_name          = string
    management_group_name = string
    description           = string
    metadata              = any
    parameters            = string
    policy_definition_reference_custom = list(object({
      policy_definition_name   = string
      parameter_values_mapping = string
    }))
    policy_definition_reference_builtin = list(object({
      policy_definition_id     = string
      parameter_values_mapping = string
    }))
  }))
}

variable "crud_timeouts" {
  type = map(string)
}

variable "ref_data" {}

variable "identity_name" {
  type = string
}

variable "identity_type" {
  type = string
}