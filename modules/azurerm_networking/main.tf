resource "azurerm_virtual_network" "vnet" {
    for_each = var.vnet
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = lookup(each.value, "address_space", [])
  dns_servers         = lookup(each.value, "dns_servers", [])
  tags                = lookup(each.value, "tags", {})
  
  dynamic "subnet" {
    for_each = each.value.subnets == null ? {} : each.value.subnets
    content{
    name             = subnet.value.name
    address_prefixes = subnet.value.address_prefixes
  }
}
dynamic "ddos_protection_plan" {
    for_each = each.value.ddos_protection_plan == null ? {} : each.value.ddos_protection_plan
    content {
      id = ddos_protection_plan.value.id
      enable = ddos_protection_plan.enable
    }
}
dynamic "encryption" {
    for_each = each.value.encryption == null ? {} : each.value.encryption
    content {
        enforcement = encryption.value.enforcement
    }
}
}