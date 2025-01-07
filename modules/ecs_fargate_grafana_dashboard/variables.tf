variable "cloudwatch_data_source_name" {
  type        = string
  default     = "cloudwatch"
  description = "name of the cloudwatch data source"
}

variable "cluster_query" {
  type        = list(string)
  default     = ["*"]
  description = "name of queriable ECS clusters"
}

variable "create_folder" {
  type        = bool
  default     = false
  description = "create a folder for the dashboard"
}

variable "enable_overwrite_dashboard" {
  type        = bool
  default     = false
  description = "overwrite the dashboard if it exists"
}

variable "region_query" {
  type        = list(string)
  default     = ["*"]
  description = "name of queriable regions"
}

variable "dashboard_uid" {
  type        = string
  default     = "cloudwatch-dashboard"
  description = "unique identifier for the dashboard"
}

variable "grafana_api_token" {
  type        = string
  description = "API token for Grafana"
}

variable "folder" {
  type        = string
  default     = ""
  description = "folder to place the dashboard in"
}

variable "prevent_destroy_if_not_empty" {
  type        = bool
  default     = true
  description = "used for the grafana folder resource"
}

variable "parent_folder_uid" {
  type        = string
  default     = ""
  description = "parent folder uid"
}
