variable "log_bucket_name" {
  description = "The name of the S3 bucket where access logs are stored."
  type        = string
}

variable "current_year" {
  description = "The current year to query logs. Alb logs are partitioned by year and month."
  type        = string
  default     = "2025"
}

variable "region" {
  description = "The AWS region."
  type        = string
  default     = "us-east-1"
}

# variable "athena_workgroup" {
#   description = "The Athena workgroup to use."
#   type        = string
#   default     = "alb-access-logs-primary"
# }

variable "glue_database_name" {
  description = "The name of the Glue database."
  type        = string
  default     = "alb_access_logs_db"
}

variable "glue_table_name" {
  description = "The name of the Glue table."
  type        = string
  default     = "access_logs"
}

variable "lifecycle_expiration_days" {
  description = "Number of days before objects are deleted."
  type        = number
  default     = 7
}

variable "log_bucket_lifecycle_expiration_days" {
  description = "Number of days before logs are deleted."
  type        = number
  default     = 30
}

variable "grafana_cloud_api_token" {
  description = "The Grafana Cloud API token."
  type        = string
}

variable "grafana_aws_account_id" {
  description = "The AWS account ID."
  type        = string
  default     = ""
}

variable "grafana_aws_external_id" {
  description = "The AWS external ID."
  type        = string
  default     = ""
}
