variable "region" {
  type        = string
  default     = "us-east-1"
  description = "value of the aws region"
}

variable "destination_bucket_arn" {
  type        = string
  description = "value of the destination bucket arn"
  default     = ""
}

variable "grafana_data_source_name" {
  type        = string
  default     = "cloudwatch"
  description = "value of the grafana data source name"
}

# details on the 'can' function: https://developer.hashicorp.com/terraform/language/functions/can
variable "type" {
  type        = string
  description = "Selects which type of data source to create. Valid values are cloudwatch, grafana-amazonprometheus-datasource, grafana-athena-datasource"
  validation {
    condition     = can(regex("cloudwatch|grafana-amazonprometheus-datasource|grafana-athena-datasource", var.type))
    error_message = "Acceptable types: cloudwatch, grafana-amazonprometheus-datasource, grafana-athena-datasource"
  }
}

variable "grafana_cloud_api_token" {
  type        = string
  default     = ""
  description = "value of the grafana cloud api token"
}

variable "enable_xray" {
  type        = bool
  default     = false
  description = "control whether to enable xray related resources are created"
}

variable "grafana_aws_account_id" {
  type        = string
  description = "value of the grafana aws account id"
  default     = ""
}

variable "grafana_aws_external_id" {
  type        = string
  description = "value of the grafana aws external id"
  default     = ""
}

variable "amp_workspace_url" {
  type        = string
  default     = ""
  description = "value of the Amazon Managed Service for Prometheus workspace url"
}

variable "athena_workgroup" {
  type        = string
  default     = ""
  description = "value of the Athena workgroup to use"
}

variable "athena_database" {
  type        = string
  default     = ""
  description = "value of the Athena database to use"
}

# variable "athena_output_location" {
#   type        = string
#   default     = ""
#   description = "value of the Athena output location"
# }

variable "athena_datasource" {
  type        = string
  default     = ""
  description = "value of the Athena datasource"
}

variable "log_bucket_name" {
  type        = string
  default     = ""
  description = "value of the log bucket name"
}
