resource "kubernetes_namespace" "client_ns" {
  for_each = toset(var.namespace_names)
  metadata {
    name = each.key
  }
}