variable "environment" {
  description = "Deployment environment (dev, qa, prod)"
  type        = string
}

variable "domain" {
  description = "The domain name for the application"
  type        = string
}

variable "odoo_service_name" {
  description = "The name of the Odoo service"
  type        = string
}

variable "key_path" {
  description = "Path to the key file"
  type        = string
  default = "private.key"
}

variable "certificate_path" {
  description = "Path to the SSL certificate file"
  type        = string
  default = "certificate.crt"
}