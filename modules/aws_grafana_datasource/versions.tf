terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0"
    }
    grafana = {
      source  = "grafana/grafana"
      version = "2.19.4"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "grafana" {
  # Commenting this out because this is the oss version of grafana
  # url  = "https://monitoring.mv-ops.com/"

  # Cloud version of Grafana
  url                       = "https://mediavine.grafana.net/"
  cloud_access_policy_token = var.grafana_api_token
}
