output "odoo_service_name" {
  description = "Odoo service name"
  value       = kubernetes_service.odoo.metadata[0].name
}

output "kubernetes_service_name" {
  value = kubernetes_service.odoo.metadata[0].name
}