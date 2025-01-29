output "namespace" {
  value = [for ns in kubernetes_namespace.namespace : ns.metadata[0].name]
}