locals {
  b    = var.context.business_tla
  a    = var.context.application_tla
  env  = var.context.environment
  hub  = var.context.hub_tla
  loc  = var.context.location
  stem = "${local.b}-${local.a}-${local.env}-${local.hub}-${var.instance}"
  flat = "${local.b}${local.a}${local.env}${local.hub}${var.instance}"
}
resource "azurerm_linux_function_app" "this" {
  name                       = "func-${local.stem}"
  location                   = local.loc
  resource_group_name        = var.resource_group_name
  service_plan_id            = var.service_plan.app_service_plan_id
  storage_account_name       = var.storage_account.name
  storage_account_access_key = var.storage_account.primary_access_key
  https_only                 = true
  tags                       = var.tags
  identity {
    type = "SystemAssigned"
  }
  site_config {
    application_stack {
      python_version = try(var.application_stack.python_version, "3.11")
    }
  }
  app_settings = var.app_settings
}
