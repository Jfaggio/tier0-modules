locals {
  b    = var.context.business_tla
  a    = var.context.application_tla
  env  = var.context.environment
  hub  = var.context.hub_tla
  loc  = var.context.location
  stem = "${local.b}-${local.a}-${local.env}-${local.hub}-${var.instance}"
  flat = "${local.b}${local.a}${local.env}${local.hub}${var.instance}"
}
resource "azurerm_automation_runbook" "this" {
  name                    = "rb-${local.stem}"
  location                = local.loc
  resource_group_name     = var.resource_group_name
  automation_account_name = var.automation_account_name
  runbook_type            = var.runbook_type
  log_verbose             = false
  log_progress            = false
  content                 = var.content
  tags                    = var.tags
}
