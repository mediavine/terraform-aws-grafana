resource "aws_iam_role" "this" {
  name = "${var.grafana_data_source_name}-role"
  assume_role_policy = templatefile("${path.module}/policies/grafana_cloud_trust_policy.json", {
    region                  = var.region
    grafana_aws_account_id  = var.grafana_aws_account_id
    grafana_aws_external_id = var.grafana_aws_external_id
  })
}

# Cloudwatch IAM Policies if var.enable_cloudwatch is true
resource "aws_iam_policy" "cloudwatch_policy" {
  count = var.enable_cloudwatch ? 1 : 0

  name        = "${var.grafana_data_source_name}-cloudwatch-policy"
  description = "Policy for reading cloudwatch data"
  policy = templatefile("${path.module}/policies/grafana_aws_policy.json", {
    region = "us-east-1"
  })
}

resource "aws_iam_role_policy_attachment" "cloudwatch_policy_attachment" {
  count = var.enable_cloudwatch ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.cloudwatch_policy[count.index].arn
}

# Promethus IAM Policies if var.enable_amazon_prometheus is true
resource "aws_iam_role_policy_attachment" "prometheus_query_policy_attachment" {
  count = var.enable_amazon_prometheus ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonPrometheusQueryAccess"
}

resource "aws_iam_role_policy_attachment" "prometheus_remote_write_policy_attachment" {
  count = var.enable_amazon_prometheus ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonPrometheusRemoteWriteAccess"
}

# X-Ray IAM Policies if var.enable_xray is true
resource "aws_iam_role_policy_attachment" "aws_xray_read_policy_attachment" {
  count = var.enable_xray ? 1 : 0

  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/AWSXrayReadOnlyAccess"
}
