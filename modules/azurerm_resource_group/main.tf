# locals {
#     common_tags = {
#         environment = "dev"
#         owner = "devops"
#         billing = "dev_team"
#     }
# }
resource "azurerm_resource_group" "rg" {
    for_each = var.rgs
  name     = each.value.name
  location = each.value.location
  tags = lookup(each.value, "tags", {})
  managed_by = lookup(each.value, "terraform", null)

}