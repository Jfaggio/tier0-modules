locals {
  b    = var.context.business_tla
  a    = var.context.application_tla
  env  = var.context.environment
  hub  = var.context.hub_tla
  loc  = var.context.location
  stem = "${local.b}-${local.a}-${local.env}-${local.hub}-${var.instance}"
  flat = "${local.b}${local.a}${local.env}${local.hub}${var.instance}"
}
resource "azurerm_automation_account" "this" {
  name                = "aa-${local.stem}"
  location            = local.loc
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  tags                = var.tags
  identity {
    type = "SystemAssigned"
  }
}
