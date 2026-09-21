locals {
  b    = var.context.business_tla
  a    = var.context.application_tla
  env  = var.context.environment
  hub  = var.context.hub_tla
  loc  = var.context.location
  stem = "${local.b}-${local.a}-${local.env}-${local.hub}-${var.instance}"
  flat = "${local.b}${local.a}${local.env}${local.hub}${var.instance}"
}
resource "random_password" "admin" {
  length  = 24
  special = false
}
resource "azurerm_postgresql_flexible_server" "this" {
  name                   = "psql-${local.stem}"
  resource_group_name    = var.resource_group_name
  location               = local.loc
  version                = var.postgresql_version
  sku_name               = var.sku_name
  storage_mb             = 32768
  administrator_login    = "psqladmin"
  administrator_password = random_password.admin.result
  zone                   = "1"
  tags                   = var.tags
}
