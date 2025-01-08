resource "grafana_data_source" "cloudwatch" {
  count = var.enable_cloudwatch ? 1 : 0

  type = "cloudwatch"
  name = "${var.grafana_data_source_name}-cloudwatch"

  json_data_encoded = jsonencode({
    defaultRegion = var.region
    authType      = "grafana_assume_role"
    assumeRoleArn = aws_iam_role.this.arn
  })
}
