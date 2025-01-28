resource "kubernetes_secret" "tls" {
  metadata {
    name      = "tls-secret"
    namespace = var.environment
  }
  data = {
    "tls.crt" = filebase64(var.certificate_path)  # Fixed key syntax
    "tls.key" = filebase64(var.key_path)          # Fixed key syntax
  }
}

resource "kubernetes_ingress" "odoo" {
  metadata {
    name      = "odoo-ingress"
    namespace = var.environment
  }
  spec {
    tls {
      secret_name = kubernetes_secret.tls.metadata[0].name
    }
    rule {
      host = "${var.environment}.example.com"
      http {
        path {
          path = "/"
          backend {
            service_name = var.odoo_service_name
            service_port = 8069
          }
        }
      }
    }
  }
}