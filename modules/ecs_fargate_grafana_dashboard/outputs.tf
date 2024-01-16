output "grafana_dashboard_id" {
  value       = grafana_dashboard.cloudwatch.dashboard_id
  description = "(Number) The numeric ID of the dashboard computed by Grafana"
}

output "grafana_dashboard_resource_id" {
  value       = grafana_dashboard.cloudwatch.id
  description = "(String) The ID of this resource."
}

output "grafana_dashboard_uid" {
  value       = grafana_dashboard.cloudwatch.id
  description = "(String) The unique identifier of a dashboard. This is used to construct its URL. It's automatically generated if not provided when creating a dashboard. The uid allows having consistent URLs for accessing dashboards and when syncing dashboards between multiple Grafana installs."
}

output "grafana_dashboard_url" {
  value       = grafana_dashboard.cloudwatch.url
  description = "(String) The URL of the dashboard in Grafana"
}

output "grafana_dashboard_version" {
  value       = grafana_dashboard.cloudwatch.version
  description = "(Number) Whenever you save a version of your dashboard, a copy of that version is saved so that previous versions of your dashboard are not lost."

}

