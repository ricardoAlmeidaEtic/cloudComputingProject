resource "kubernetes_secret" "tls" {
  metadata {
    name      = "tls-secret"
    namespace = var.environment
  }
  data = {
    "tls.crt" = filebase64(var.certificate_path)
    "tls.key" = filebase64(var.key_path)
  }
}

resource "kubernetes_ingress_v1" "odoo" {
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
            service {
              name = var.odoo_service_name
              port {
                number = 8069
              }
            }
          }
        }
      }
    }
  }
}