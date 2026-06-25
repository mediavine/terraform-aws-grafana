module "this" {
  source = "../../modules/aws_grafana_datasource"

  region                   = "us-east-1"
  grafana_data_source_name = "xray-test"
  type                     = "grafana-x-ray-datasource"
  grafana_cloud_api_token  = "glsa_some_token_here"
  grafana_aws_account_id   = "008923505280"
  grafana_aws_external_id  = "1136183"
}
