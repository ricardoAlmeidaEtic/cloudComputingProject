output "namespaces" {
  description = "List of created namespaces"
  value       = [for ns in kubernetes_namespace.client_ns : ns.metadata[0].name]
}

output "odoo_service_name" {
  value = var.odoo_service_name
}