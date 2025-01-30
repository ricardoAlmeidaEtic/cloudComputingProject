resource "kubernetes_ingress_v1" "odoo_ingress" {
  metadata {
    name      = "odoo-ingress"
    namespace = var.namespace
    annotations = {
      "nginx.ingress.kubernetes.io/ssl-redirect" = "true"
      "cert-manager.io/cluster-issuer"          = var.cluster_issuer_name
    }
  }

  spec {
    rule {
      host = var.domain
      http {
        path {
          path = "/"
          backend {
            service {
              name = "odoo-service"
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    tls {
      hosts       = [var.domain]
      secret_name = "odoo-tls-secret"
    }
  }
}