locals {
  b    = var.context.business_tla
  a    = var.context.application_tla
  env  = var.context.environment
  hub  = var.context.hub_tla
  loc  = var.context.location
  stem = "${local.b}-${local.a}-${local.env}-${local.hub}-${var.instance}"
  flat = "${local.b}${local.a}${local.env}${local.hub}${var.instance}"
}
locals {
  runtime = lower(try(var.application_stack.runtime, "python"))
  rt_ver  = tostring(try(var.application_stack.version, "3.11"))
  ai_settings = var.app_insights == null ? {} : {
    APPLICATIONINSIGHTS_CONNECTION_STRING = var.app_insights.connection_string
  }
}
resource "azurerm_linux_web_app" "this" {
  name                = "web-linux-${local.stem}"
  location            = local.loc
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan.app_service_plan_id
  https_only          = true
  # SGEC baseline: FTPS off, TLS 1.2 minimum, no remote debugging
  client_certificate_enabled    = false
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags
  identity {
    type = "SystemAssigned"
  }
  site_config {
    always_on                = try(var.site_config.always_on, false)
    ftps_state               = "Disabled"
    minimum_tls_version      = "1.2"
    http2_enabled            = true
    remote_debugging_enabled = false
    application_stack {
      java_version   = local.runtime == "java" ? local.rt_ver : null
      java_server    = local.runtime == "java" ? try(var.application_stack.java_server, "JAVA") : null
      python_version = local.runtime == "python" ? local.rt_ver : null
      node_version   = local.runtime == "node" ? local.rt_ver : null
      dotnet_version = local.runtime == "dotnet" ? local.rt_ver : null
    }
  }
  app_settings = merge(local.ai_settings, var.app_settings)
}
