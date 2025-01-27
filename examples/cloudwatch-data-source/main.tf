module "this" {
  source                   = "../../modules/aws_grafana_datasource"
  type                     = "cloudwatch"
  region                   = var.region
  grafana_data_source_name = var.grafana_data_source_name
  grafana_cloud_api_token  = "sometokenhere"
}
