module "this" {
  source = "../../modules/ecs_fargate_grafana_dashboard"

  cloudwatch_data_source_name = "S2S"
  cluster_query               = ["s2s-us-east-1", "s2s-us-west-1", "s2s-us-west-2"]
  region_query                = ["us-east-1", "us-west-1", "us-west-2", "random1"]
  dashboard_uid               = "s2s-fargate-dashboard"
  create_folder               = true
  grafana_api_token           = "sometokenhere"
}
