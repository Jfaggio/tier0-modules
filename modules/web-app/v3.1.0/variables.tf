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
variable "service_plan" {
  description = "The service-plan module object (app_service_plan_id, os_type)."
  type        = any
}
variable "app_insights" {
  type    = any
  default = null
}
variable "application_stack" {
  description = "runtime (java|python|node|dotnet) and version; java_server for java."
  type        = any
  default     = {}
}
variable "app_settings" {
  type    = map(string)
  default = {}
}
variable "site_config" {
  type    = any
  default = {}
}
variable "connection_strings" {
  type    = any
  default = []
}
variable "public_network_access_enabled" {
  type    = bool
  default = true
}
variable "private_endpoint_subnet" {
  type    = any
  default = null
}
variable "vnet_integration_subnet" {
  type    = any
  default = null
}
variable "private_ip_address" {
  type    = any
  default = null
}
variable "diagnostics" {
  type    = any
  default = {}
}
variable "monitoring" {
  type    = any
  default = {}
}
variable "key_vaults" {
  type    = any
  default = []
}
variable "storage_accounts" {
  type    = any
  default = []
}
variable "no_proxy_endpoints" {
  type    = list(string)
  default = []
}
variable "virtual_applications" {
  type    = any
  default = []
}
variable "aad_auth_settings" {
  type    = any
  default = null
}
variable "dsocode" {
  type    = string
  default = ""
}
