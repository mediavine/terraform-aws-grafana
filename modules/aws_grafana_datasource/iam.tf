resource "aws_iam_user" "this" {
  name = "${var.grafana_data_source_name}-user"
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

# Cloudwatch IAM Policies if var.enable_cloudwatch is true
resource "aws_iam_policy" "cloudwatch_policy" {
  count = var.enable_cloudwatch ? 1 : 0

  name        = "${var.grafana_data_source_name}-cloudwatch-policy"
  description = "Policy for reading cloudwatch data"
  policy = templatefile("../../modules/aws_grafana_datasource/policies/grafana_aws_policy.json", {
    region = "us-east-1"
  })
}

resource "aws_iam_user_policy_attachment" "cloudwatch_policy_attachment" {
  count = var.enable_cloudwatch ? 1 : 0

  user       = aws_iam_user.this.name
  policy_arn = aws_iam_policy.cloudwatch_policy[count.index].arn
}

# Promethus IAM Policies if var.enable_amazon_prometheus is true
resource "aws_iam_user_policy_attachment" "prometheus_query_policy_attachment" {
  count = var.enable_amazon_prometheus ? 1 : 0

  user       = aws_iam_user.this.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonPrometheusQueryAccess"
}

resource "aws_iam_user_policy_attachment" "prometheus_remote_write_policy_attachment" {
  count = var.enable_amazon_prometheus ? 1 : 0

  user       = aws_iam_user.this.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonPrometheusRemoteWriteAccess"
}

# X-Ray IAM Policies if var.enable_xray is true
resource "aws_iam_user_policy_attachment" "aws_xray_read_policy_attachment" {
  count = var.enable_xray ? 1 : 0

  user       = aws_iam_user.this.name
  policy_arn = "arn:aws:iam::aws:policy/AWSXrayReadOnlyAccess"
}