variable "aws_access_key" {
  default = null
}
variable "aws_secret_key" {
  default = null
}

variable "region" {
  type        = string
  default     = "eu-south-1"
  description = "AWS region"
}
variable "cluster_name" {
  type    = string
  default = "upday-cluster"
}
variable "kubernetes_version" {
  type    = string
  default = "1.21"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.16.0/20"
}
variable "private_subnet_cidr" {
  default = "10.0.0.0/20"
}
variable "desired_capacity" {
  default = 3
}
variable "asg_max_instance" {
  default = 5

}
variable "worker_instance_type" {
  default = "t3.small"
}

