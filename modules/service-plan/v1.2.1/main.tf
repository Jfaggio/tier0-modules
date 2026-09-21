locals {
  b    = var.context.business_tla
  a    = var.context.application_tla
  env  = var.context.environment
  hub  = var.context.hub_tla
  loc  = var.context.location
  stem = "${local.b}-${local.a}-${local.env}-${local.hub}-${var.instance}"
  flat = "${local.b}${local.a}${local.env}${local.hub}${var.instance}"
}
resource "azurerm_service_plan" "this" {
  name                = "plan-${local.stem}"
  resource_group_name = var.resource_group_name
  location            = local.loc
  os_type             = var.os_type
  sku_name            = var.sku_name
  tags                = var.tags
}
