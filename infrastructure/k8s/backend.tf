terraform {
  backend "s3" {
    bucket         = "upday-terraform-state-files"
    key            = "infra/infrastructure.state"
    region         = "us-east-1"
    dynamodb_table = "infrastructure-tftable"

  }
}
