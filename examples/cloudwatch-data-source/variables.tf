variable "region" {
  type = string
  default = "us-east-1"
  description = "value of the aws region"  
}

variable "grafana_data_source_name" {
  type = string
  default = "journey"
  description = "value of the grafana data source name"
  
}