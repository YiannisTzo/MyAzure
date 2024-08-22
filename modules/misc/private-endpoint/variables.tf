variable "global_tags" {
  type = map(string)
}

variable "crud_timeouts" {
  type = map(string)
}


variable "azure_tenant_id" {
  type = string
}

variable "region" {
  type = string
}

variable "private_endpoint_config" {
  type = map(object({
    provider_alias                    = string
    is_applicable                     = bool
    resource_group_name               = string
    vnet_name                         = string
    subnet_name                       = string
    private_service_connection_name   = string
    target_resource_name              = string
    subresource_names                 = list(string)
    private_connection_resource_alias = string
    request_message                   = string
    is_manual_connection              = bool

    private_dns_zone_group = object({
      private_dns_zone_group_name = string
      private_dns_zone_names      = list(string)
      private_dns_zone_ids        = list(string)
    })

    ip_configuration = list(object({
      name               = string
      private_ip_address = string
      subresource_name   = string
      member_name        = string
    }))

    target_resource_type = string
    tags                 = map(string)
  }))
}

variable "ref_data" {
  type = any
}
