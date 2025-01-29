
output "odoo_service_url" {
  value = module.ingress.service_url
}

output "postgres_service_url" {
  value = module.postgres.service_url
}