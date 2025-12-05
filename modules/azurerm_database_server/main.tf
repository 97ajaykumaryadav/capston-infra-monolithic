data "azurerm_key_vault" "kv" {
    for_each = var.mssql_server
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}


data "azurerm_key_vault_secret" "sql_adminusername" {
    for_each = var.mssql_server
  name         = each.value.sql_adminusername
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "sql_adminpassword" {
    for_each = var.mssql_server
  name         = each.value.sql_adminpassword
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}
resource"azurerm_mssql_server" "mssql_server"{
    for_each = var.mssql_server
    name = each.value.mssql_server_name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    version = each.value.mssql_server_version
    administrator_login = data.azurerm_key_vault_secret.sql_adminusername[each.key].value
    administrator_login_password = data.azurerm_key_vault_secret.sql_adminpassword[each.key].value
}

resource "azurerm_mssql_database" "database" {
  for_each = var.mssql_server
  name         = each.value.db_name
  server_id    = azurerm_mssql_server.mssql_server[each.key].id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = each.value.max_size_gb
  sku_name     = "S0"
  enclave_type = "VBS"
}