variable "environment" {
  description = "Deployment environment (dev, qa, prod)"
  type        = string
}

variable "database_host" {
  description = "PostgreSQL database host"
  type        = string
  default     = "postgres-service"  # Default to Kubernetes service name
}