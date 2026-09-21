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
variable "subnet_address_space" { type = string }
variable "profile" {
  type    = string
  default = "internal"
}
variable "service_delegations" {
  type    = any
  default = []
}
variable "service_endpoints" {
  type    = list(string)
  default = []
}
variable "service_endpoint_policy_ids" {
  type    = list(string)
  default = []
}
variable "virtual_network" {
  type    = any
  default = null
}
variable "storage_account_sftp_enabled" {
  type    = bool
  default = false
}
variable "enable_appe_automatic_approved_nsg_rules" {
  type    = bool
  default = false
}
variable "enable_staging_function_app" {
  type    = bool
  default = false
}
