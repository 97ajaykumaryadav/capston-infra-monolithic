module "rg" {
  source = "../../modules/azurerm_resource_group"
  rgs = var.resource_group
}
module "vnet" {
    depends_on = [ module.rg ]
  source = "../../modules/azurerm_networking"
  vnet = var.virtual_network
}
module "pip" {
    depends_on = [ module.rg ]
  source = "../../modules/azurerm_public_ip"
  pip = var.pip
}
module "key_vault" {
  depends_on = [ module.rg ]
  source = "../../modules/azurerm_key_vault"
  key_vaults = var.key_vaults
}

module "vm" {
depends_on = [ module.vnet, module.pip ]
  source = "../../modules/computing"
 virtual_machine = var.virtual_machine

}
module "mssql" {
  source = "../../modules/azurerm_database_server"
  mssql_server = var.mssql_server

}