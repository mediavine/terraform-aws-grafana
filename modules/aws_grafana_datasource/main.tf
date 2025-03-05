resource "grafana_data_source" "cloudwatch" {
  count = var.type == "cloudwatch" ? 1 : 0

  type = var.type
  name = "${var.grafana_data_source_name}-cloudwatch"

  json_data_encoded = jsonencode({
    defaultRegion = var.region
    authType      = "grafana_assume_role"
    assumeRoleArn = aws_iam_role.this[count.index].arn
  })
}

resource "grafana_data_source" "amazon_managed_prometheus" {
  count = var.type == "grafana-amazonprometheus-datasource" ? 1 : 0

  type = var.type
  name = "${var.grafana_data_source_name}-amazon-prometheus"
  url  = var.amp_workspace_url

  json_data_encoded = jsonencode({
    httpMethod    = "POST"
    sigV4Auth     = true
    sigV4AuthType = "keys"
    sigV4Region   = var.region
  })

  secure_json_data_encoded = jsonencode({
    sigV4AccessKey = aws_iam_access_key.this[count.index].id
    sigV4SecretKey = aws_iam_access_key.this[count.index].secret
  })
}

resource "grafana_data_source" "athena" {
  count = var.type == "grafana-athena-datasource" ? 1 : 0

  type = var.type
  name = "${var.grafana_data_source_name}-athena"

  json_data_encoded = jsonencode({
    defaultRegion = var.region
    authType      = "grafana_assume_role"
    assumeRoleArn = aws_iam_role.this[count.index].arn
    catalog       = var.athena_datasource
    workgroup     = var.athena_workgroup
    database      = var.athena_database
    # outputLocation = var.athena_output_location
  })

}
