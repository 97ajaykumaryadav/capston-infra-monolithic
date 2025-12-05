variable "virtual_machine"{

  type = map(object({
    name                  = string
    nic_name               = string
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

