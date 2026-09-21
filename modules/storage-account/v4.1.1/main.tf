locals {
  b    = var.context.business_tla
  a    = var.context.application_tla
  env  = var.context.environment
  hub  = var.context.hub_tla
  loc  = var.context.location
  stem = "${local.b}-${local.a}-${local.env}-${local.hub}-${var.instance}"
  flat = "${local.b}${local.a}${local.env}${local.hub}${var.instance}"
}
resource "azurerm_storage_account" "this" {
  name                            = substr("st${local.flat}", 0, 24)
  resource_group_name             = var.resource_group_name
  location                        = local.loc
  account_tier                    = split("_", var.account_sku_type)[0]
  account_replication_type        = split("_", var.account_sku_type)[1]
  account_kind                    = var.account_kind
  access_tier                     = var.account_access_tier
  min_tls_version                 = "TLS1_2"
  public_network_access_enabled   = var.public_network_access_enabled
  is_hns_enabled                  = var.hierarchical_namespaces
  sftp_enabled                    = var.sftp_enabled
  large_file_share_enabled        = var.large_file_share_enabled
  allow_nested_items_to_be_public = false
  # SGEC baseline: infrastructure encryption, HTTPS only, no cross-tenant replication
  infrastructure_encryption_enabled = true
  enable_https_traffic_only         = true
  cross_tenant_replication_enabled  = false
  blob_properties {
    delete_retention_policy {
      days = 7
    }
    container_delete_retention_policy {
      days = 7
    }
  }
  tags = var.tags
}
