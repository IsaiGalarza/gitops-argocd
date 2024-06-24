# Configure Kubernetes provider and connect to the Kubernetes API server
provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

# Using Docker-Desktop
# provider "kubernetes" {
#   host = "https://localhost:6443"
#   config_context_cluster = "docker-desktop"
#   config_path            = "~/.kube/config"
# }
