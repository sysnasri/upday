# The Kubernetes (K8S) provider is used to interact with the resources supported by Kubernetes.
# The provider needs to be configured with the proper credentials before it can be used.

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token

}

