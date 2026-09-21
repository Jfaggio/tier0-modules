output "id" { value = azurerm_subnet.this.id }
output "name" { value = azurerm_subnet.this.name }
output "address_prefixes" { value = azurerm_subnet.this.address_prefixes }
output "network_security_group_id" { value = azurerm_network_security_group.this.id }
output "network_security_group_name" { value = azurerm_network_security_group.this.name }
output "virtual_network_name" { value = local.vnet_name }
output "profile" { value = var.profile }
output "storage_account_sftp_enabled" { value = var.storage_account_sftp_enabled }
