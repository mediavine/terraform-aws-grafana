variable "grafana_api_token" {
  type        = string
  description = "API token for Grafana"
}

variable "postgres_data_source_name" {
  type        = string
  default     = "postgres"
  description = "name of the postgres data source"
}

variable "dashboard_uid" {
  type        = string
  default     = "Postgres-Dashboard"
  description = "unique identifier for the dashboard"
}

variable "dbinstanceidentifier" {
  type        = list(string)
  description = "DB instance identity of the RDS instance"
}

variable "region" {
  type        = list(string)
  description = "AWS region"
}

variable "create_folder" {
  type        = bool
  default     = false
  description = "create a folder for the dashboard"
}

variable "folder" {
  type        = string
  default     = ""
  description = "folder to place the dashboard in"
}

variable "enable_overwrite_dashboard" {
  type        = bool
  default     = false
  description = "overwrite the dashboard if it exists"
}

variable "database_name" {
  type        = string
  description = "name of the database"
}
