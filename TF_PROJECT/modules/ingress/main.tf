resource "kubernetes_ingress" "odoo" {
  metadata {
    name      = "odoo-ingress"
    namespace = var.namespace
  }

  spec {
    rule {
      host = "odoo.${var.client_name}.com"
      
      http {
        path {
          path = "/"
          
          backend {
            service_name = "odoo-service"
            service_port = 80
          }
        }
      }
    }
  }
}