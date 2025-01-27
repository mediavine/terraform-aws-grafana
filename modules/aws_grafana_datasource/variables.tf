variable "region" {
  type        = string
  default     = "us-east-1"
  description = "value of the aws region"
}

variable "grafana_data_source_name" {
  type        = string
  default     = "cloudwatch"
  description = "value of the grafana data source name"
}

# details on the 'can' function: https://developer.hashicorp.com/terraform/language/functions/can
variable "type" {
  type        = string
  description = "control whether to enable cloudwatch related resources are created"
  validation {
    condition     = can(regex("cloudwatch|grafana-amazonprometheus-datasource", var.type))
    error_message = "Type must be either cloudwatch or grafana-amazonprometheus-datasource."
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
