output "odoo_deployment" {
  value = kubernetes_deployment.odoo.metadata[0].name
}