variable "namespace_names" {
  description = "List of namespaces to create"
  type        = list(string)
  default     = ["dev", "qa", "prod"]
}