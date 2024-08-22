variable "region" {
  description = "location where your resource needs to be provisioned in azure"
}

variable "resource_groups" {
  type = map(object({
    provider_alias      = string
    is_applicable       = bool
    resource_group_tags = map(string)
  }))
}

variable "global_tags" {
  type = map(string)
}

variable "crud_timeouts" {
  type = map(string)
}