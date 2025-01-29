resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.client_name
  }
}

resource "kubernetes_deployment" "this" {
  metadata {
    name      = "example-deployment"
    namespace = kubernetes_namespace.namespace.metadata[0].name
  }

  spec {
    replicas = 3
    selector {
      match_labels = {
        app = "example"
      }
    }

    template {
      metadata {
        labels = {
          app = "example"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:latest"
        }
      }
    }
  }
}