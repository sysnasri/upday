variable "aws_access_key" {
  default = null
}
variable "aws_secret_key" {
  default = null
}

variable "application_key" {
  default = null
}
variable "application_secret" {
  default = null
}
variable "consumer_key" {
  default = null
}
variable "region" {
  type        = string
  default     = "eu-south-1"
  description = "AWS region"
}

variable "domain_name" {
  default = {

    zone      = "nasri.it"
    subdomain = "upday"
    fqdn      = "upday.nasri.it"

  }
}
variable "cluster_name" {
  type    = string
  default = "upday-cluster"
}
