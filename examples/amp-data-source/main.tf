module "this" {
  source = "../../modules/aws_grafana_datasource"

  region                   = "us-east-1"
  grafana_data_source_name = "amp-test"
  type                     = "grafana-amazonprometheus-datasource"
  grafana_cloud_api_token  = "glsa_some_token_here"
  amp_workspace_url        = "https://aps-workspaces.us-east-1.amazonaws.com/workspaceshhhjj"
}
