output "kubernetes_cluster_id" {
  value = "minikube"  # This is valid for local Minikube
}

# Add any other outputs you need from this module
output "namespace_name" {
  value = kubernetes_namespace.namespace.metadata[0].name
}