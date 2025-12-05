resource_group = {
    rg1 = {
 name     = "rg-capston-dev-cic-001"
  location = "centralindia"
  tags = {
     owner = "dev"
     billing = "devops"
  }
  managed_by = "terraform"}
}
virtual_network = {
    vnet1 = {
   name                = "vnet-capston-dev-cic-001"
  location            = "centralindia"
  resource_group_name = "rg-capston-dev-cic-001"
  address_space       = ["10.0.0.0/16"]
  subnets = {
    subnet1 = {
    name = "snet-app-capston-dev-001"
    address_prefixes = ["10.0.1.0/24"]
  }
    subnet2 = {
    name = "snet-app-capston-dev-002"
    address_prefixes = ["10.0.2.0/24"]
  }
  #   subnet3 = {
  #   name = "snet-db-capston-dev-001"
  #   address_prefixes = ["10.0.3.0/24"]
  # }
  #  subnet4 = {
  #   name = "snet-db-capston-dev-002"
  #   address_prefixes = ["10.0.4.0/24"]
  # }
  }
    }
}
   pip = {
    pip1 = {
  name                = "pip-capston-dev-001"
  resource_group_name = "rg-capston-dev-cic-001"
  location            = "centralindia"
  allocation_method   = "Static"
    }
   
   
#      pip2 = {
#   name                = "pip-capston-dev-002"
#   resource_group_name = "rg-capston-dev-cic-001"
#   location            = "centralindia"
#   allocation_method   = "Static"
#     }
    }
  #       pip3 = {
#   name                = "pip-capston-dev-003"
#   resource_group_name = "rg-capston-dev-cic-001"
#   location            = "centralindia"
#   allocation_method   = "Static"
#     }
  #  }

    key_vaults = {
  kv1 = {
    kv_name  = "kv-capston-dev-cic-01"
    location = "centralindia"
    rg_name  = "rg-capston-dev-cic-001"
  }
}


mssql_server = {
  sql_server = {
    mssql_server_name = "sqls-capston-dev"
    key_vault_name        = "kv-capston-dev-cic-01"
    resource_group_name = "rg-capston-dev-cic-001"
    location            = "centralindia"
    mssql_server_version = "12.0"
    sql_adminusername = "dbusername"
    sql_adminpassword = "dbpassword"
    db_name = mysql-capston-dev
    max_size_gb = 2
    
  }
}

virtual_machine = {
  vm1 = {
    name                  = "vm-web-capston-dev-01"
    resource_group_name   = "rg-capston-dev-cic-001"
    location              = "centralindia"
    virtual_network_name  = "vnet-capston-dev-cic-001"
    subnet_name           = "snet-app-capston-dev-001"
    public_ip_name        = "pip-capston-dev-01"
    key_vault_name        = "kv-capston-dev-cic-01"
    vm_username_secret    = "vmusername"
    vm_password_secret    = "vmpassword"
    nic_name              = "nic-web-capston-dev-01"
    script_name           = "nginx.sh"
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }


#     vm2 = {
#     name                  = "worker-vm1"
#     resource_group_name   = "rg-dev-001"
#     location              = "centralindia"
#     virtual_network_name  = "dev-vnet-prom"
#     subnet_name           = "dev-subnet2"
#     public_ip_name        = "devvmpip2"
#     key_vault_name        = "dev-keyvault-vp"
#     vm_username_secret    = "vmusername"
#     vm_password_secret    = "vmpassword"
#     nic_name              = "devpromnic1"
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-focal"
#     sku       = "20_04-lts"
#     version   = "latest"
#   }
  
  #   vm3 = {
  #   name                  = "worker-vm2"
  #   resource_group_name   = "rg-dev-001"
  #   location              = "centralindia"
  #   virtual_network_name  = "dev-vnet-prom"
  #   subnet_name           = "dev-subnet1"
  #   public_ip_name        = "devvmpip3"
  #   key_vault_name        = "dev-keyvault-vp"
  #   vm_username_secret    = "vmusername"
  #   vm_password_secret    = "vmpassword"
  #   nic_name              = "devpromnic2"
  #   publisher = "Canonical"
  #   offer     = "0001-com-ubuntu-server-focal"
  #   sku       = "20_04-lts-gen2"
  #   version   = "latest"
  # }
# }
}