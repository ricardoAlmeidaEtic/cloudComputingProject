variable "environment" {
  description = "Deployment environment (dev, qa, prod)"
  type        = string
}

variable "database_host" {
  description = "The hostname of the database"
  type        = string
}

variable "odoo_service_name" {
  description = "Odoo service name"
  type        = string
}