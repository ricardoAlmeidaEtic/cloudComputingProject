provider "kubernetes" {
  alias       = "cluster"
  config_path = "~/.kube/config"
}

resource "minikube_cluster" "my-cluster" {
    cluster_name="etic-cluster"
    driver="docker"
    nodes=2
    addons=[
        "ingress"
    ]
}