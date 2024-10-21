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
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.3"
    }

    template = {
      source  = "hashicorp/template"
      version = ">= 2.2.0"
    }
  }
}

# provider "aws" {
# }

provider "grafana" {
  url  = "https://monitoring.mv-ops.com/"
  auth = var.grafana_api_token
}
