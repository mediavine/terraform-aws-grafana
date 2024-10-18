terraform {
  required_version = ">= 1.0"
  backend "s3" {
    bucket = "mediavine-terraform-test"
    key    = "postgres-data-source/terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
  }
}
