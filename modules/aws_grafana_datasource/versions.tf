terraform {
    required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    grafana = {
      source  = "grafana/grafana"
      version = "2.8.1"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "grafana" {
  url   = "https://monitoring.mv-ops.com/"
  auth  = var.grafana_api_token
}