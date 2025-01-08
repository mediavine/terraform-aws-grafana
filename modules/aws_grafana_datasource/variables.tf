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

variable "enable_cloudwatch" {
  type        = bool
  default     = false
  description = "control whether to enable cloudwatch related resources are created"
}

variable "grafana_api_token" {
  type        = string
  default     = ""
  description = "value of the grafana api token"
}

variable "enable_amazon_prometheus" {
  type        = bool
  default     = false
  description = "control whether to enable amazon prometheus related resources are created"
}

variable "enable_xray" {
  type        = bool
  default     = false
  description = "control whether to enable xray related resources are created"
}

variable "grafana_aws_account_id" {
  type        = string
  description = "value of the grafana aws account id"
}

variable "grafana_aws_external_id" {
  type        = string
  description = "value of the grafana aws external id"
}
