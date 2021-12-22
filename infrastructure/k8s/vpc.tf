



data "aws_availability_zones" "available" {}



resource "random_string" "suffix" {
  length  = 8
  special = false
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.2.0"


  name                 = "education-vpc"
  cidr                 = var.vpc_cidr
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = cidrsubnets(var.private_subnet_cidr, 2, 2, 2) #["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"] #
  public_subnets       = cidrsubnets(var.public_subnet_cidr, 2, 2, 2)  #["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"] #
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = "1"
  }
}
