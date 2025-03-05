module "this" {
  source = "../../modules/athena_access_logs"

  log_bucket_name         = "s2s-us-east-1-alb-logs"
  grafana_cloud_api_token = "sometokenhere"
  grafana_aws_account_id  = "008923000000"
  grafana_aws_external_id = "00000000"
}
