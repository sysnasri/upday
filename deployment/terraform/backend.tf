terraform {
  backend "s3" {
    bucket         = "upday-terraform-state-files"
    key            = "deploy/deployment.state"
    region         = "us-east-1"
    dynamodb_table = "infrastructure-tftable"

  }
}
