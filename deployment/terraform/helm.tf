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
  set {

    name  = "nginx.ingress.kubernetes\\.io/ssl-redirect"
    value = "true"

  }
  set {
    name  = "nginx.ingress.kubernetes\\.io/force-ssl-redirect"
    value = "true"
  }
  set {
    name  = "nginx.ingress.kubernetes\\.io/rewrite-target"
    value = "/"
  }


}




resource "helm_release" "metricserver" {
  name              = "metrics-server"
  repository        = "https://kubernetes-sigs.github.io/metrics-server/"
  chart             = "metrics-server"
  namespace         = "metric-server"
  create_namespace  = true
  force_update      = true
  dependency_update = true


}

resource "helm_release" "upday" {
  name  = "upday-chart"
  chart = "../charts/upday"
}
