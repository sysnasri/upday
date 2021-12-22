variable "aws_access_key" {
  default = null
}
variable "aws_secret_key" {
  default = null
}

variable "region" {
  type        = string
  default     = "us-west-2"
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
variable "worker_instance_type" {
  default = "t3.micro"
}
variable "ingress" {
  type    = string
  default = "https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.4/deploy/static/provider/aws/deploy.yaml"
}
