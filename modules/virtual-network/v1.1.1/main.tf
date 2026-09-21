locals {
  b    = var.context.business_tla
  a    = var.context.application_tla
  env  = var.context.environment
  hub  = var.context.hub_tla
  loc  = var.context.location
  stem = "${local.b}-${local.a}-${local.env}-${local.hub}-${var.instance}"
  flat = "${local.b}${local.a}${local.env}${local.hub}${var.instance}"
}
resource "azurerm_virtual_network" "this" {
  name                = "vnet-${local.stem}"
  location            = local.loc
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags
}
