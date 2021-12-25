# The Helm provider is used to deploy software packages in Kubernetes. 
# The provider needs to be configured with the proper credentials before it can be used.

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.eks.token

  }
}
# A Release is an instance of a chart running in a Kubernetes cluster.
# A Chart is a Helm package. It contains all of the resource definitions necessary
# to run an application, tool, or service inside of a Kubernetes cluster.

resource "helm_release" "nginx_ingress" {
  name              = "ingress-nginx"
  repository        = "https://kubernetes.github.io/ingress-nginx"
  chart             = "ingress-nginx"
  namespace         = "nginx-ingress"
  create_namespace  = true
  dependency_update = true


  # Value block with custom values to be merged with the values yaml.

  set {
    name  = "service.type"
    value = "LoadBalancer"

  }
  set {
    name  = "controller.service.targetPorts.https"
    value = "http"
  }
  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-backend-protocol"
    value = "http"
  }
  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-ssl-ports"
    value = "https"

  }


  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-ssl-cert"
    value = aws_acm_certificate.upday-cert.arn
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
