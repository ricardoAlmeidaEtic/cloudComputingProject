provider "kubernetes" {
  config_path = "~/.kube/config"  # Path to your kubeconfig file
}

module "kubernetes" {
  source      = "./modules/kubernetes"
  client_name = var.client_name
}

module "namespaces" {
  source       = "./modules/namespaces"
  client_name  = var.client_name
  environments = var.environments
}

# Other modules should reference namespaces from the namespaces module
module "odoo" {
  source      = "./modules/odoo"
  client_name = var.client_name
  namespace   = module.namespaces.namespace  # Reference correct output
}

module "postgres" {
  source      = "./modules/postgres"
  client_name = var.client_name
  namespace   = module.namespaces.namespace
}

module "ingress" {
  source      = "./modules/ingress"
  client_name = var.client_name
  namespace   = module.namespaces.namespace
  enable_https = var.enable_https
}