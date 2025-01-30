variable "client" {
  description = "The name of the client (Netflix, Meta, Rockstar)"
  type        = string
}

variable "environment" {
  description = "The environment (dev, qa, prod)"
  type        = string
}

variable "domain" {
  description = "The domain name for the application"
  type        = string
}

variable "replicas" {
  description = "Number of replicas for the Odoo application"
  type        = number
  default     = 1
}

variable "db_name" {
  description = "The PostgreSQL database name"
  type        = string
  default     = "odoo"
}

variable "db_user" {
  description = "The PostgreSQL database user"
  type        = string
  default     = "odoo"
}

variable "db_password" {
  description = "The PostgreSQL database password"
  type        = string
  default     = "odoo"
}