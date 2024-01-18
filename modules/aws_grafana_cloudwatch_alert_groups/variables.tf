variable "org_id" {
  type = number
  default = 1
  description = "value of org_id"
}

variable "rule_group_name" {
  type = string
  description = "value of rule_group_name"
}

variable "folder_uid" {
  type = string
  description = "value of folder_uid"
}

variable "rule_name" {
  type = string
  description = "value of rule_name"
}

variable "datasource_uid" {
  type = string
  description = "value of datasource_uid"
}

variable "metric_dimensions" {
  type = map(string)
  description = "value of dimensions"
  default = {
    LoadBalancer = "*"
  }
}

variable "cloudwatch_metric_name" {
  type = string
  description = "value of cloudwatch_metric_name"
  default = "HTTPCode_Target_5XX_Count"
}

variable "cloudwatch_namespace" {
  type = string
  description = "value of cloudwatch_namespace"
  default = "AWS/ApplicationELB"
}

variable "data_source_aws_region" {
  type = string
  description = "value of data_source_aws_region"
  default = "us-east-1" 
}

variable "statistics" {
  type = list(string)
  description = "value of statistics"
  default = ["Sum"]

  validation {
    condition = length(var.statistics) == 1
    error_message = "statistics must be a non-empty list"
  }
}

variable "evaluator_type" {
  type = string
  description = "value of evaluator_type must be gt, lt, eq, neq, within_range, outside_range, no_value, is_above, is_below, has_no_value, changes"
  default = "gt"

  validation {
    condition     = contains(["gt", "lt", "eq", "neq", "within_range", "outside_range", "no_value", "is_above", "is_below", "has_no_value", "changes"], var.evaluator_type)
    error_message = "The evaluator_type must be one of the following: gt, lt, eq, neq, within_range, outside_range, no_value, is_above, is_below, has_no_value, changes."
  }
}

variable "evaluator_threshold" {
  type        = list(number)
  description = "Threshold value(s) for the evaluator"
  default     = [300]
}

variable "reducer_type" {
  type        = string
  description = "Type of the reducer to use for the alert condition. Must be one of: avg, sum, min, max, count, last, median, percent_diff, count_non_null, diff"
  default     = "sum"

  validation {
    condition     = contains(["avg", "sum", "min", "max", "count", "last", "median", "percent_diff", "count_non_null", "diff"], var.reducer_type)
    error_message = "The reducer_type must be one of the following: avg, sum, min, max, count, last, median, percent_diff, count_non_null, diff."
  }
}

variable "alert_duration" {
  description = "Duration for the alert condition"
  type        = number
  default     = 300
}

resource "random_string" "alert_id" {
  length  = 5
  special = false
}

variable "alert_id" {
  description = "ID of the alert"
  type        = string
  default     = random_string.alert_id.result
}

resource "random_string" "rule_uid" {
  length  = 16
  special = false
}

variable "rule_uid" {
  description = "UID of the rule"
  type        = string
  default     = random_string.rule_uid.result
}

variable "alert_message" {
    type = string
    description = "value of alert_message"
    default = ""
}