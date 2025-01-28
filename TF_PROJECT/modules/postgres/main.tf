resource "kubernetes_service" "postgres" {
  metadata {
    name      = "postgres-service"
    namespace = var.environment
  }
  spec {
    selector = {
      app = "postgres"
    }
    port {
      port        = 5432
      target_port = 5432
    }
  }
}