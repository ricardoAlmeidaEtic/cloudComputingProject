resource "minikube_cluster" "my-cluster" {
  cluster_name = "my-minikube-cluster"
  driver       = "docker"             
  nodes        = 1                    
}

resource "kubernetes_namespace" "client_ns" {
  for_each = toset(var.namespace_names)
  metadata {
    name = each.key
  }
}