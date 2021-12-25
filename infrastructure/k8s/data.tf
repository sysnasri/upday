# Retrieve information about an EKS Cluster.
data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

# Get an authentication token to communicate with an EKS cluster.
# Uses IAM credentials from the AWS provider to generate a temporary token 
# that is compatible with AWS IAM Authenticator authentication. 

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

# The Availability Zones data source allows access to the list of AWS Availability Zone
# which can be accessed by an AWS account within the region configured in the provider.
data "aws_availability_zones" "available" {}