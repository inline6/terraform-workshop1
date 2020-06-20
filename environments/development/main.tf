# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
}

# Configure backend for S3
terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket1990"
    key            = "development/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}