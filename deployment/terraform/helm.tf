
provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.eks.token
  }
}
resource "helm_release" "nginx_ingress" {
  name              = "nginx-ingress-controller"
  repository        = "https://charts.bitnami.com/bitnami"
  chart             = "nginx-ingress-controller"
  namespace         = "nginx-ingress"
  create_namespace  = true
  force_update      = true
  dependency_update = true

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

}
