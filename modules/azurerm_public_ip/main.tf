resource "azurerm_public_ip" "pip" {
  for_each = var.pip

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method

  sku                 = lookup(each.value, "sku", null)
  sku_tier            = lookup(each.value, "sku_tier", null)
  ip_version          = lookup(each.value, "ip_version", null)
  domain_name_label   = lookup(each.value, "domain_name_label", null)
  idle_timeout_in_minutes = lookup(each.value, "idle_timeout_in_minutes", null)
  ip_tags             = lookup(each.value, "ip_tags", null)
  reverse_fqdn        = lookup(each.value, "reverse_fqdn", null)
  zones               = lookup(each.value, "zones", [])
  tags                = lookup(each.value, "tags", {})
}
