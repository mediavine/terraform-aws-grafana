variable "datasources" {
  description = "Map of datasource configurations for alerting"
  type = map(object({
    uid              = string
    region           = string
    load_balancer_id = optional(string) # arn suffix: app/my-alb/1234567890 (omit to match all)
    target_group_id  = optional(string) # arn suffix: targetgroup/my-tg/1234567890 (omit to match all)
    # Unhealthy host percentage alert
    unhealthy_host_percentage_threshold      = optional(number, 25)   # Percentage of unhealthy hosts to trigger alert (e.g., 25 = >25%)
    unhealthy_host_percentage_pending_period = optional(string, "2m") # How long percentage must exceed threshold before alerting
    unhealthy_host_percentage_dashboard_uid  = optional(string, "")
    unhealthy_host_percentage_panel_id       = optional(string, "")

    # Unhealthy host count alert
    unhealthy_host_count_threshold      = optional(number, 1)     # Count of unhealthy hosts to trigger alert (e.g., 1 = >= 1)
    unhealthy_host_count_pending_period = optional(string, "20m") # How long count must exceed threshold before alerting
    unhealthy_host_count_dashboard_uid  = optional(string, "")
    unhealthy_host_count_panel_id       = optional(string, "")

    # Target 5xx error rate alert
    target_5xx_error_rate_threshold      = optional(number, 5)    # Percentage of 5xx errors to trigger alert (e.g., 5 = >5%)
    target_5xx_error_rate_pending_period = optional(string, "2m") # How long error rate must exceed threshold before alerting
    target_5xx_error_rate_dashboard_uid  = optional(string, "")
    target_5xx_error_rate_panel_id       = optional(string, "")

    # Target latency alert
    target_latency_threshold_ms   = optional(number, 500)  # Latency threshold in milliseconds (e.g., 500 = >500ms)
    target_latency_pending_period = optional(string, "2m") # How long latency must exceed threshold before alerting
    target_latency_dashboard_uid  = optional(string, "")
    target_latency_panel_id       = optional(string, "")

    # ECS resource dimensions (omit to match all services/clusters)
    ecs_cluster_name = optional(string) # ECS cluster name (omit to match all clusters)
    ecs_service_name = optional(string) # ECS service name (omit to match all services in cluster)

    # ECS memory utilization alert
    ecs_memory_utilization_threshold      = optional(number, 60)    # Memory utilization percentage threshold (e.g., 60 = >60%)
    ecs_memory_utilization_pending_period = optional(string, "15m") # How long utilization must exceed threshold before alerting
    ecs_memory_utilization_dashboard_uid  = optional(string, "")
    ecs_memory_utilization_panel_id       = optional(string, "")

    # ECS CPU utilization alert
    ecs_cpu_utilization_threshold      = optional(number, 60)    # CPU utilization percentage threshold (e.g., 60 = >60%)
    ecs_cpu_utilization_pending_period = optional(string, "15m") # How long utilization must exceed threshold before alerting
    ecs_cpu_utilization_dashboard_uid  = optional(string, "")
    ecs_cpu_utilization_panel_id       = optional(string, "")

    # ALB connection errors alert (RejectedConnectionCount + TargetConnectionErrorCount)
    alb_connection_errors_threshold      = optional(number, 1)    # Total connection errors to trigger alert (e.g., 1 = >= 1)
    alb_connection_errors_pending_period = optional(string, "2m") # How long errors must persist before alerting
    alb_connection_errors_dashboard_uid  = optional(string, "")
    alb_connection_errors_panel_id       = optional(string, "")
  }))
}

variable "alert_folder_uid" {
  description = "UID of the Grafana folder for alerts"
  type        = string
}

variable "notification_policy_uid" {
  description = "UID of the contact point for notifications"
  type        = string
  default     = ""
}

variable "runbook_url" {
  description = "URL of the runbook for the alert"
  type        = string
  default     = ""
}
