output "names" { value = [for t in azurerm_storage_table.this : t.name] }
output "ids" { value = [for t in azurerm_storage_table.this : t.id] }
