resource "minikube_cluster" "my-cluster" {
    cluster_name = var.cluster.name
    driver = "docker"
    nodes = 1

}

resource "kubernetes_namespace" "client_ns" {
  for_each = toset(var.namespace_names)
  metadata {
    name = each.key
  }
}