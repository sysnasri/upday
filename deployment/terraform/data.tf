data "kubernetes_service" "nginx-ingress-svc" {
  metadata {
    name      = "nginx-ingress-controller"
    namespace = helm_release.nginx_ingress.namespace
  }
}

data "aws_eks_cluster" "eks" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "eks" {
  name = var.cluster_name
}


