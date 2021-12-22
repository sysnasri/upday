terraform {
  
  required_providers {


    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.65.0"

    }
     helm = {
      source = "hashicorp/helm"
      version = "2.4.1"
    }

    ovh = {
      source  = "ovh/ovh"
      version = "0.16.0"

    }

    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }

    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }

  required_version = ">= 0.14"
}


