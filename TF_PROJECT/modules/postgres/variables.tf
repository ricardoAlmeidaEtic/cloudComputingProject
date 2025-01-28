variable "environment" {
  description = "Deployment environment (dev, qa, prod)"
  type        = string
}

variable "db_user" {
  description = "Postgres username"
  type        = string
  default     = "odoo"
}

variable "db_password" {
  description = "Postgres password"
  type        = string
  default     = "securepassword"
}