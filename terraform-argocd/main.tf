
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.argocd_namespace
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = kubernetes_namespace.argocd.metadata[0].name
  repository = "https://argoproj.github.io/argo-helm"
  version    = "6.7.11"
  chart      = "argo-cd"

  values = [
    <<EOF
    configs:
      secret:
        argocdServerAdminPassword: "$2b$12$KIXu..eHNrnhQxN36GdqKOBwQzFNz/wVxr6Y3IzmY5fjkB6Pgr1Xm"
    EOF
  ]
}