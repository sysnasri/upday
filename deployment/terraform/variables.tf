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
  default     = "us-west-2"
  description = "AWS region"
}
variable "ingress" {
  type    = string
  default = "https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.4/deploy/static/provider/aws/deploy.yaml"
}
variable "app_name" {
  default = "upday-app"

}
variable "service_name" {
  default = "upday-service"
}
variable "default_namespace" {
  default = "upday"

}
variable "service_type" {
  default = "ClusterIP"
}
variable "image" {
  default = "nasri/upday-java:v1"
}
variable "containerport" {
  default = [{
    name          = "web-cn"
    internal_port = "8080"
    host_port     = "8080"


    }
  ]
}


variable "service_ports" {
  default = [{
    name          = "web"
    internal_port = "8080"
    external_port = "80"
    }
  ]

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
