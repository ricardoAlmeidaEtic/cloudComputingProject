provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "client_namespace" {
  metadata {
    name = "${var.client}-${var.environment}"
  }
}

module "kubernetes" {
  source    = "./services/kubernetes"
  namespace = kubernetes_namespace.client_namespace.metadata[0].name
}

module "postgres" {
  source      = "./services/postgres"
  namespace   = kubernetes_namespace.client_namespace.metadata[0].name
  db_name     = var.db_name
  db_user     = var.db_user
  db_password = var.db_password
}

module "odoo" {
  source       = "./services/odoo"
  namespace    = kubernetes_namespace.client_namespace.metadata[0].name
  replicas = var.replicas
  db_host     = module.postgres.db_host
  db_user     = module.postgres.db_user
  db_password = module.postgres.db_password
  db_name     = module.postgres.db_name
}

module "ingress" {
  source             = "./services/ingress"
  domain        = var.domain
  namespace          = kubernetes_namespace.client_namespace.metadata[0].name
  cluster_issuer_name = kubernetes_manifest.cluster_issuer.manifest.metadata.name
}

data "http" "cert_manager" {
  url = "https://github.com/cert-manager/cert-manager/releases/download/v1.13.1/cert-manager.yaml"
}

resource "local_file" "cert_manager_yaml" {
  filename = "${path.module}/cert-manager.yaml"
  content  = data.http.cert_manager.response_body
}

resource "kubernetes_manifest" "cluster_issuer" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "ClusterIssuer"
    metadata = {
      name = "letsencrypt-prod"
    }
    spec = {
      acme = {
        server = "https://acme-v02.api.letsencrypt.org/directory"
        email  = "fake@example.com"
        privateKeySecretRef = {
          name = "letsencrypt-prod"
        }
        solvers = [
          {
            http01 = {
              ingress = {
                class = "nginx"
              }
            }
          }
        ]
      }
    }
  }
}