resource "kubernetes_namespace" "namespace" {
  for_each = toset(var.environments)

  metadata {
    name = "${var.client_name}-${each.key}"
  }
}