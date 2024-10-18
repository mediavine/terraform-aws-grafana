output "cloudwatch_data_source_name" {
  value = grafana_data_source.cloudwatch[0].name
}

output "cloudwatch_data_source_id" {
  value = grafana_data_source.cloudwatch[0].id
}
