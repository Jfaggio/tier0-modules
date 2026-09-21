resource "azurerm_storage_table" "this" {
  for_each             = toset(var.tables)
  name                 = each.value
  storage_account_name = var.storage_account.name
}
