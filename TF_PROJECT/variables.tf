variable "environment" {
  description = "Deployment environment (dev, qa, prod)"
  type        = string
}

variable "client" {
  description = "The client name"
  type        = string
}

variable "domain" {
  description = "The domain"
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
