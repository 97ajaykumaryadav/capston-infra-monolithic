variable "resource_group" {
type = map(object({ 
  name     = string
  location = string
  tags = optional(map(string))
  managed_by = optional(string)
}))
}
variable "virtual_network" {
  

  type = map(object({
name                 = string
  location            = string
  resource_group_name = string
  address_space       = optional(list(string))
  dns_servers         = optional(list(string))
  tags                = optional(map(string))
  subnets = optional(map(object({
    name = string
    address_prefixes = list(string)
  })))
  ddos_protection_plan = optional(map(object({
    id = string
    enable = bool
  })))
encryption = optional(object({
    enforcement = string
}))

  }))
}
variable "pip" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string               
    sku                 = optional(string)    
    sku_tier            = optional(string)     
    ip_version          = optional(string)     
    domain_name_label   = optional(string)     
    idle_timeout_in_minutes = optional(number) 
    ip_tags             = optional(map(string))
    reverse_fqdn        = optional(string)     
    zones               = optional(list(string))
    tags                = optional(map(string))
  }))
}

variable "key_vaults" {
}

variable "virtual_machine" {
  type = map(object({
    name                  = string
    nic_name              = string
    resource_group_name   = string
    location              = string
    virtual_network_name  = string
    subnet_name           = string
    public_ip_name        = string
    key_vault_name        = string
    vm_username_secret    = string
    vm_password_secret    = string
    publisher             = string
    offer                 = string
    sku                   = string
    version               = string
    script_name           = optional(string)
  }))
}
variable "mssql_server" {
  
}



