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

provider "grafana" {
  # Commenting this out because this is the oss version of grafana
  # url  = "https://monitoring.mv-ops.com/"

  # Cloud version of Grafana
  url = "https://mediavine.grafana.net/"
  # not using var.grafana_api_token here because we don't want to break deploys
  auth = var.grafana_cloud_api_token
}
