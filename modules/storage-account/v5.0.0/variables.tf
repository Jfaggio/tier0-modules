variable "context" {
  description = "Spoke context (business_tla, application_tla, environment, hub_tla, location, core_*)."
  type        = map(any)
}
variable "secrets" {
  description = "Platform values composed by the reusable workflow (TENANT_ID, SPOKE_SUBSCRIPTION_ID, PCS_MANAGEMENT_SUBSCRIPTION_ID)."
  type        = map(any)
  sensitive   = true
  default     = {}
}
variable "instance" {
  description = "Instance suffix, part of every resource name."
  type        = string
}
variable "tags" {
  type    = map(string)
  default = {}
}
variable "resource_group_name" { type = string }
variable "account_sku_type" {
  type    = string
  default = "Standard_LRS"
}
variable "account_kind" {
  type    = string
  default = "StorageV2"
}
variable "account_access_tier" {
  type    = string
  default = "Hot"
}
variable "public_network_access_enabled" {
  type    = bool
  default = true
}
variable "hierarchical_namespaces" {
  type    = bool
  default = false
}
variable "sftp_enabled" {
  type    = bool
  default = false
}
variable "large_file_share_enabled" {
  type    = bool
  default = false
}
variable "subnet" {
  type    = any
  default = null
}
variable "routed_subnet" {
  type    = any
  default = null
}
variable "monitoring" {
  type    = any
  default = {}
}
variable "storage_blob_data_protection" {
  type    = any
  default = {}
}
variable "storage_blob_properties_enabled" {
  type    = bool
  default = true
}
variable "smb" {
  type    = any
  default = {}
}
variable "storage_blob_cors_rule" {
  type    = any
  default = []
}
variable "file_share_cors_rule" {
  type    = any
  default = []
}
