locals {
  b    = var.context.business_tla
  a    = var.context.application_tla
  env  = var.context.environment
  hub  = var.context.hub_tla
  loc  = var.context.location
  stem = "${local.b}-${local.a}-${local.env}-${local.hub}-${var.instance}"
  flat = "${local.b}${local.a}${local.env}${local.hub}${var.instance}"
}
resource "azurerm_log_analytics_workspace" "this" {
  name                = "law-${local.stem}"
  location            = local.loc
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.tags
}
resource "azurerm_application_insights" "this" {
  name                = "appi-${local.stem}"
  location            = local.loc
  resource_group_name = var.resource_group_name
  application_type    = var.application_insights_type
  workspace_id        = azurerm_log_analytics_workspace.this.id
  tags                = var.tags
}
