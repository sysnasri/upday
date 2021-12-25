# serve as parameters for a Terraform module,
# so users can customize behavior without editing the source.

variable "region" {
  type        = string
  default     = "eu-south-1"
  description = "AWS region"
}
variable "cluster_name" {
  type        = string
  default     = "upday-cluster"
  description = "A name for EKS cluster "
}
variable "kubernetes_version" {
  type        = string
  default     = "1.21"
  description = "Kuberenetes cluster Version "
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Virtual Private Cloud Subnet/Cidr "
}

variable "public_subnet_cidr" {
  default     = "10.0.16.0/20"
  description = "Public Subnet with Internet facing"
}
variable "private_subnet_cidr" {
  default     = "10.0.0.0/20"
  description = "Public Subnet without Internet facing"
}
variable "desired_capacity" {
  default     = 2
  description = "Desired number of worker/ec2 instances in eks"
}
variable "asg_max_instance" {
  default     = 5
  description = "Maximum number of worker/ec2 instances in eks"

}
variable "worker_instance_type" {
  default     = "t3.small"
  description = "Aws Ec2/worker size type in eks "
}

variable "environment_tag" {
  default     = "upday-production"
  description = "AWS key value tag "
}

