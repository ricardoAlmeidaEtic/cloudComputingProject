provider "kubernetes" {
  alias       = "cluster"
  config_path = "~/.kube/config"
}
resource "kubernetes_namespace" "my-cluster" {
  provider = kubernetes.cluster
  metadata {
    name = "namespace-cluster"
  }
}