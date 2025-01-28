module "kubernetes_cluster" {
  source = "./modules/kubernetes_cluster"
  odoo_service_name = module.odoo.kubernetes_service_name
}

module "postgres" {
  source = "./modules/postgres"
  environment = var.environment
}

module "odoo" {
  source         = "./modules/odoo"
  environment    = var.environment
  database_host  = module.postgres.db_host
  odoo_service_name = module.odoo.kubernetes_service_name
}


module "ingress" {
  source            = "./modules/ingress"
  domain            = var.domain
  environment       = var.environment
  certificate_path  = var.certificate_path
  key_path          = var.key_path
  odoo_service_name = module.odoo.kubernetes_service_name
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = "${var.client}-${var.environment}"
  }
}