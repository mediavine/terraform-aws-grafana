resource "aws_iam_role" "athena" {
  name = "athena-access-logs-role-${var.region}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "athena.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "athena_s3_access" {
  name = "athena-s3-access-policy-${var.region}"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket",
          "s3:PutObject"
        ]
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.destination_bucket.bucket}",
          "arn:aws:s3:::${aws_s3_bucket.destination_bucket.bucket}/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "athena_s3_access" {
  role       = aws_iam_role.athena.name
  policy_arn = aws_iam_policy.athena_s3_access.arn
}
