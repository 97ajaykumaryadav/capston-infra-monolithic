variable "pip" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string               # e.g. "Static" or "Dynamic"
    sku                 = optional(string)     # e.g. "Standard" or "Basic"
    sku_tier            = optional(string)     # e.g. "Regional" or "Global"
    ip_version          = optional(string)     # e.g. "IPv4" or "IPv6"
    domain_name_label   = optional(string)     # e.g. for DNS name
    idle_timeout_in_minutes = optional(number) # e.g. 4–30 mins
    ip_tags             = optional(map(string))# e.g. {"Usage"="AppGateway"}
    reverse_fqdn        = optional(string)     # optional reverse DNS
    zones               = optional(list(string))
    tags                = optional(map(string))
  }))
}
