###############################################
# Create a bucket for terraform state file # 

# Make Sure you have exported AWS_SECRET_KEY and AWS_ACCESS_KEY
# in the shell or in the CI 

################################################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.65.0"

    }
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "upday-terraform-state-files"
  lifecycle {
    prevent_destroy = false
  }
  force_destroy = true
  versioning {
    enabled = true
  }


}

resource "aws_dynamodb_table" "terraform_state_lock" {

  name           = "infrastructure-tftable"
  write_capacity = 1
  read_capacity  = 1
  hash_key       = "LockID"


  attribute {
    name = "LockID"
    type = "S"
  }
}
