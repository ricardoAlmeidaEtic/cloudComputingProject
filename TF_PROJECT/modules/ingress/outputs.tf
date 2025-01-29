output "service_url" {
  value = var.enable_https ? "https://odoo.${var.client_name}.com" : "http://odoo.${var.client_name}.com"
}