data "azurerm_key_vault" "kv" {
    for_each = var.virtual_machine
  name                = each.value.key_vault_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault_secret" "vmusername-secret" {
    for_each = var.virtual_machine
  name         = each.value.vm_username_secret
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}
data "azurerm_key_vault_secret" "vmpassword-secret" {
    for_each = var.virtual_machine
  name         = each.value.vm_password_secret
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}
data "azurerm_subnet" "subnet" {
    for_each = var.virtual_machine
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pip" {
    for_each = var.virtual_machine
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_network_interface" "nic" {
   for_each = var.virtual_machine
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
    for_each = var.virtual_machine
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = "Standard_D2s_v3"
  custom_data = try(base64encode(file(each.value.script_name)), null)
  admin_username      = data.azurerm_key_vault_secret.vmusername-secret[each.key].value
 admin_password       = data.azurerm_key_vault_secret.vmpassword-secret[each.key].value
 disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}