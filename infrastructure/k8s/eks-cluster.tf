# Terraform module to create an Elastic Kubernetes (EKS)
# cluster and associated worker instances on AWS

provider "aws" {
  region = var.region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version
  subnets         = module.vpc.private_subnets

  tags = {
    Environment = var.environment_tag

  }

  vpc_id = module.vpc.vpc_id

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "worker-group-1"
      asg_max_size                  = var.asg_max_instance
      instance_type                 = var.worker_instance_type
      asg_desired_capacity          = var.desired_capacity
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    }
  ]
}

