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

    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.22.0"
    }
  }
}

#have to connect to database with existing user to create a read only role for datasource
provider "postgresql" {
  scheme           = "awspostgres"
  port             = var.port
  host             = var.primary_host
  database         = var.primary_database_name
  username         = var.master_username #existing username in db to use for connection
  password         = var.master_password #existing pwd in db to use for connection
  superuser        = false               # must be set to false since we're not connecting with a superuser role
  sslmode          = var.sslmode
  connect_timeout  = 15
  expected_version = var.expected_version
}

# provider "aws" {
# }

provider "grafana" {
  # Commenting this out because this is the oss version of grafana
  # url  = "https://monitoring.mv-ops.com/"

  # Cloud version of Grafana
  url = "https://mediavine.grafana.net/"
  # not using var.grafana_api_token here because we don't want to break deploys
  cloud_access_policy_token = var.grafana_cloud_api_token
}
