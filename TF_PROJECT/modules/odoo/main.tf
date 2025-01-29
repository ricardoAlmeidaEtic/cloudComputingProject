resource "kubernetes_deployment" "odoo" {
  metadata {
    name      = "odoo"
    namespace = var.namespace
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "odoo"
      }
    }

    template {
      metadata {
        labels = {
          app = "odoo"
        }
      }

      spec {
        container {
          name  = "odoo"
          image = "odoo:latest"
        }
      }
    }
  }
}