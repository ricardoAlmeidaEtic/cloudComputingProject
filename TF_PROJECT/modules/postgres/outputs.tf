output "service_url" {
  value = "postgres://${var.client_name}-postgres:5432/odoo"
}