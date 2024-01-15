variable "cloudwatch_data_source_name" {
  type = string
  default = "cloudwatch"
  description = "name of the cloudwatch data source"
}

variable "cluster_query" {
  type = list(string)
  default = ["*"]
  description = "name of queriable ECS clusters"  
}

variable "dashboard_uid" {
  type = string
  default = "cloudwatch-dashboard"
  description = "unique identifier for the dashboard"
}