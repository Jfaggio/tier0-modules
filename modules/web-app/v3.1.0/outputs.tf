output "id" { value = azurerm_linux_web_app.this.id }
output "name" { value = azurerm_linux_web_app.this.name }
output "resource_group_name" { value = azurerm_linux_web_app.this.resource_group_name }
output "kind" { value = azurerm_linux_web_app.this.kind }
output "operating_system" { value = "Linux" }
output "default_hostname" { value = azurerm_linux_web_app.this.default_hostname }
output "hosting_environment_id" { value = null }
output "principal_id" { value = azurerm_linux_web_app.this.identity[0].principal_id }
