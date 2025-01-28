resource "kubernetes_deployment" "odoo" {
  metadata {
    name      = "odoo"
    namespace = var.environment
  }
  spec {
    replicas = 3
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
          image = "odoo:latest"
          name  = "odoo"
          env {
            name  = "DB_HOST"
            value = var.database_host
          }
          env {
            name  = "DB_PORT"
            value = "5432"
          }
          port {
            container_port = 8069
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "odoo" {
  metadata {
    name      = "odoo-service"
    namespace = var.environment
  }
  spec {
    selector = {
      app = "odoo"
    }
    port {
      port        = 8069
      target_port = 8069
    }
  }
}
