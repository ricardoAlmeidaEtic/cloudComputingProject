variable "namespace_names" {
  description = "List of namespaces to create"
  type        = list(string)
  default     = ["dev", "qa", "prod"]
}

variable "odoo_service_name" {
  description = "Name of the Odoo service"
  type        = string
}