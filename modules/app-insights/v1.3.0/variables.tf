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
variable "application_insights_type" {
  type    = string
  default = "web"
}
