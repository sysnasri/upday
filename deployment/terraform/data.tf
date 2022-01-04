# This data source allows you to pull data about such service.
# It fetches LoadBalacner hostname to use it for a CNAME record 

data "kubernetes_service" "nginx-ingress-svc" {
  metadata {
    name      = "ingress-nginx-controller"
    namespace = helm_release.nginx_ingress.namespace
  }
}
# Retrieve information about an EKS Cluster.

data "aws_eks_cluster" "eks" {
  name = var.cluster_name
}
# Get an authentication token to communicate with an EKS cluster.
# Uses IAM credentials from the AWS provider to generate a temporary token 
# that is compatible with AWS IAM Authenticator authentication. 


data "aws_eks_cluster_auth" "eks" {
  name = var.cluster_name
}


