locals {
  b    = var.context.business_tla
  a    = var.context.application_tla
  env  = var.context.environment
  hub  = var.context.hub_tla
  loc  = var.context.location
  stem = "${local.b}-${local.a}-${local.env}-${local.hub}-${var.instance}"
  flat = "${local.b}${local.a}${local.env}${local.hub}${var.instance}"
}
data "azurerm_client_config" "current" {}
locals {
  tenant_id = try(var.secrets.TENANT_ID, data.azurerm_client_config.current.tenant_id)
}
resource "azurerm_key_vault" "this" {
  name                            = substr("kv${local.flat}", 0, 24)
  location                        = local.loc
  resource_group_name             = var.resource_group_name
  tenant_id                       = local.tenant_id
  sku_name                        = var.sku_name
  soft_delete_retention_days      = 7
  purge_protection_enabled        = false # SGEC sets true; off here so a demo can be torn down
  enabled_for_deployment          = false
  enabled_for_template_deployment = false
  public_network_access_enabled   = true
  tags                            = var.tags
  network_acls {
    default_action = "Allow"
    bypass         = "AzureServices"
  }
}
# The deploying principal gets the policy the real module grants the spoke SP, so that
# azurerm_key_vault_secret resources in the subscription repository work on the first apply.
resource "azurerm_key_vault_access_policy" "deployer" {
  key_vault_id            = azurerm_key_vault.this.id
  tenant_id               = local.tenant_id
  object_id               = data.azurerm_client_config.current.object_id
  key_permissions         = var.key_permissions
  secret_permissions      = var.secret_permissions
  certificate_permissions = var.certificate_permissions
}
