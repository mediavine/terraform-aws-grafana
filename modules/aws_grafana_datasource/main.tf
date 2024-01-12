resource "grafana_data_source" "this" {
  count = var.enable_cloudwatch ? 1 : 0
  
  type = "cloudwatch"
  name = "${var.grafana_data_source_name}-cloudwatch"

  json_data_encoded = jsonencode({
    defaultRegion = "us-east-1"
    authType      = "keys"
  })

  secure_json_data_encoded = sensitive(jsonencode({
    accessKey = aws_iam_access_key.this.id
    secretKey = aws_iam_access_key.this.secret
  }))

  depends_on = [ aws_iam_access_key.this ]
}