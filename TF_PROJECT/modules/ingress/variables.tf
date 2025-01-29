variable "client_name" {
    description = "Name of the client"
    type        = string
}

variable "namespace" {
    description = "Kubernetes namespace"
    type        = string
}

variable "enable_https" {
    description = "Enable HTTPS for ingress"
    type        = bool
    default     = true
}