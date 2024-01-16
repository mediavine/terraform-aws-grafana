module "this" {
  source = "../../modules/aws_grafana_datasource"

  region                   = var.region
  grafana_data_source_name = var.grafana_data_source_name
  enable_cloudwatch        = true
  grafana_api_token        = "sometokenhere"
}