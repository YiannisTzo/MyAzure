variable "user_assigned_managed_identities" {
  type = map(object({
    resource_group_name = string
    permissions         = list(string)
    scope               = string
    tags                = map(string)
  }))
  default = {}
}

variable "resource_role_config" {
  type = list(object({
    scope          = string
    role           = string
    principal_type = string
    principal_id   = string
  }))
  default = []
}

variable "global_tags" {
  type = map(string)
}

variable "crud_timeouts" {
  type = map(string)
}

variable "region" {
  type = string
}
