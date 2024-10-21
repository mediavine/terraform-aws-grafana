# variable "region" {
#   type        = string
#   default     = "us-east-1"
#   description = "value of the aws region"
# }

variable "grafana_data_source_name" {
  type        = string
  default     = "sandbox"
  description = "value of the grafana data source name"
}

# variable "postgres_data_source_name" {
#   type        = string
#   default     = "sandbox"
#   description = "value of the postgres data source name"
# } //Declared but not used.
