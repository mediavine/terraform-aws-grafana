output "grafana_data_source_name" {
  description = "name of the postgres datasource"
  value       = grafana_data_source.postgres.name
}