############################################
# Destination Bucket Configuration
############################################

# Destination bucket for Athena query results
resource "aws_s3_bucket" "destination_bucket" {
  bucket = "${var.log_bucket_name}-query-results"

  tags = {
    Name = "Athena_s3_bucket"
  }
}

# Lifecycle rule configuration for the destination bucket
resource "aws_s3_bucket_lifecycle_configuration" "destination_bucket" {
  bucket = aws_s3_bucket.destination_bucket.id

  rule {
    id = "expire-query-results"

    expiration {
      days = var.lifecycle_expiration_days
    }
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "destination_bucket" {
  bucket = aws_s3_bucket.destination_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

############################################
# S3 Log Config for Destination Bucket
############################################
resource "aws_s3_bucket" "log_bucket" {
  bucket = "${var.log_bucket_name}-query-logs"

  tags = {
    Name = "Athena_s3_log_bucket"
  }
}

# Lifecycle rule configuration for the destination bucket
resource "aws_s3_bucket_lifecycle_configuration" "log_bucket" {
  bucket = aws_s3_bucket.log_bucket.id

  rule {
    id = "expire-logs"

    expiration {
      days = var.log_bucket_lifecycle_expiration_days
    }
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "log_bucket" {
  bucket = aws_s3_bucket.log_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_logging" "destination_bucket" {
  bucket = aws_s3_bucket.destination_bucket.id

  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "log/"
}

resource "aws_s3_bucket_logging" "log_bucket" {
  depends_on = [aws_s3_bucket.log_bucket]

  bucket        = aws_s3_bucket.log_bucket.id
  target_bucket = aws_s3_bucket.log_bucket.id
  target_prefix = "logoflogs/"
}
