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
  vnet_name = var.virtual_network == null ? var.context.core_vnet_name : var.virtual_network.name
  vnet_rg   = var.virtual_network == null ? var.context.core_resource_group : var.virtual_network.resource_group_name
}
resource "azurerm_network_security_group" "this" {
  name                = "nsg-${local.stem}"
  location            = local.loc
  resource_group_name = local.vnet_rg
  tags                = var.tags
}
resource "azurerm_subnet" "this" {
  name                 = "subnet-${local.stem}"
  resource_group_name  = local.vnet_rg
  virtual_network_name = local.vnet_name
  address_prefixes     = [var.subnet_address_space]
  service_endpoints    = var.service_endpoints
  dynamic "delegation" {
    for_each = var.service_delegations
    content {
      name = delegation.value.name
      service_delegation {
        name    = delegation.value.service_delegation.name
        actions = try(delegation.value.service_delegation.actions, [])
      }
    }
  }
}
resource "azurerm_subnet_network_security_group_association" "this" {
  subnet_id                 = azurerm_subnet.this.id
  network_security_group_id = azurerm_network_security_group.this.id
}
# SGEC baseline for an internal subnet: nothing comes in from the Internet, the vnet talks to
# itself, everything else is denied and logged by the platform's own rules on the real hub.
resource "azurerm_network_security_rule" "deny_internet_in" {
  name                        = "DenyInternetInbound"
  priority                    = 4000
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
  resource_group_name         = local.vnet_rg
  network_security_group_name = azurerm_network_security_group.this.name
}
