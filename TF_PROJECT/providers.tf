terraform {
  required_providers {
    minikube = {
      source  = "scott-the-programmer/minikube"
      version = "0.4.4"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.11.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 3.0"
    }
  }
}

provider "minikube" {
  # Configuration options for the minikube provider (if any)
}

provider "kubernetes" {
  host                   = minikube_cluster.my-cluster.host
  client_certificate     = minikube_cluster.my-cluster.client_certificate
  client_key             = minikube_cluster.my-cluster.client_key
  cluster_ca_certificate = minikube_cluster.my-cluster.cluster_ca_certificate
}

provider "tls" {
  # Configuration options for the tls provider
}