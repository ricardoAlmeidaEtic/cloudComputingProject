provider "kubernetes" {
  config_path = var.kubeconfig_path
}

module "kubernetes_cluster" {
  source = "./modules/kubernetes_cluster"
}

module "odoo" {
  source = "./modules/odoo"
  environment = var.environment
  database_host = module.postgres.db_host 
}

module "postgres" {
  source = "./modules/postgres"
  environment = var.environment
}

module "ingress" {
  source            = "./modules/ingress"
  domain            = var.domain
  environment       = var.environment
  certificate_path  = var.certificate_path  # Pass the certificate path
  key_path          = var.key_path          # Pass the key path
  odoo_service_name = module.odoo.service_name
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = "${var.client}-${var.environment}"
  }
}