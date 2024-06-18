provider "aws" {
  region  = "us-east-1"
  # profile = "sandbox"
}
terraform {
  backend "s3" {
    bucket = "mediavine-terraform-test"
    key    = "postgres-data-source/terraform.tfstate"
    region = "us-east-1"
  }
}