# baseline_alerts

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.MD updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [grafana_rule_group.alb_connection_errors](https://registry.terraform.io/providers/hashicorp/grafana/latest/docs/resources/rule_group) | resource |
| [grafana_rule_group.ecs_cpu_utilization](https://registry.terraform.io/providers/hashicorp/grafana/latest/docs/resources/rule_group) | resource |
| [grafana_rule_group.ecs_memory_utilization](https://registry.terraform.io/providers/hashicorp/grafana/latest/docs/resources/rule_group) | resource |
| [grafana_rule_group.target_5xx_error_rate](https://registry.terraform.io/providers/hashicorp/grafana/latest/docs/resources/rule_group) | resource |
| [grafana_rule_group.target_latency](https://registry.terraform.io/providers/hashicorp/grafana/latest/docs/resources/rule_group) | resource |
| [grafana_rule_group.unhealthy_host_count](https://registry.terraform.io/providers/hashicorp/grafana/latest/docs/resources/rule_group) | resource |
| [grafana_rule_group.unhealthy_host_percentage](https://registry.terraform.io/providers/hashicorp/grafana/latest/docs/resources/rule_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_folder_uid"></a> [alert\_folder\_uid](#input\_alert\_folder\_uid) | UID of the Grafana folder for alerts | `string` | n/a | yes |
| <a name="input_datasources"></a> [datasources](#input\_datasources) | Map of datasource configurations for alerting | <pre>map(object({<br>    uid              = string<br>    region           = string<br>    load_balancer_id = optional(string) # arn suffix: app/my-alb/1234567890 (omit to match all)<br>    target_group_id  = optional(string) # arn suffix: targetgroup/my-tg/1234567890 (omit to match all)<br>    # Unhealthy host percentage alert<br>    unhealthy_host_percentage_threshold      = optional(number, 25)   # Percentage of unhealthy hosts to trigger alert (e.g., 25 = >25%)<br>    unhealthy_host_percentage_pending_period = optional(string, "2m") # How long percentage must exceed threshold before alerting<br>    unhealthy_host_percentage_dashboard_uid  = optional(string, "")<br>    unhealthy_host_percentage_panel_id       = optional(string, "")<br><br>    # Unhealthy host count alert<br>    unhealthy_host_count_threshold      = optional(number, 1)     # Count of unhealthy hosts to trigger alert (e.g., 1 = >= 1)<br>    unhealthy_host_count_pending_period = optional(string, "20m") # How long count must exceed threshold before alerting<br>    unhealthy_host_count_dashboard_uid  = optional(string, "")<br>    unhealthy_host_count_panel_id       = optional(string, "")<br><br>    # Target 5xx error rate alert<br>    target_5xx_error_rate_threshold      = optional(number, 5)    # Percentage of 5xx errors to trigger alert (e.g., 5 = >5%)<br>    target_5xx_error_rate_pending_period = optional(string, "2m") # How long error rate must exceed threshold before alerting<br>    target_5xx_error_rate_dashboard_uid  = optional(string, "")<br>    target_5xx_error_rate_panel_id       = optional(string, "")<br><br>    # Target latency alert<br>    target_latency_threshold_ms   = optional(number, 500)  # Latency threshold in milliseconds (e.g., 500 = >500ms)<br>    target_latency_pending_period = optional(string, "2m") # How long latency must exceed threshold before alerting<br>    target_latency_dashboard_uid  = optional(string, "")<br>    target_latency_panel_id       = optional(string, "")<br><br>    # ECS resource dimensions (omit to match all services/clusters)<br>    ecs_cluster_name = optional(string) # ECS cluster name (omit to match all clusters)<br>    ecs_service_name = optional(string) # ECS service name (omit to match all services in cluster)<br><br>    # ECS memory utilization alert<br>    ecs_memory_utilization_threshold      = optional(number, 60)    # Memory utilization percentage threshold (e.g., 60 = >60%)<br>    ecs_memory_utilization_pending_period = optional(string, "15m") # How long utilization must exceed threshold before alerting<br>    ecs_memory_utilization_dashboard_uid  = optional(string, "")<br>    ecs_memory_utilization_panel_id       = optional(string, "")<br><br>    # ECS CPU utilization alert<br>    ecs_cpu_utilization_threshold      = optional(number, 60)    # CPU utilization percentage threshold (e.g., 60 = >60%)<br>    ecs_cpu_utilization_pending_period = optional(string, "15m") # How long utilization must exceed threshold before alerting<br>    ecs_cpu_utilization_dashboard_uid  = optional(string, "")<br>    ecs_cpu_utilization_panel_id       = optional(string, "")<br><br>    # ALB connection errors alert (RejectedConnectionCount + TargetConnectionErrorCount)<br>    alb_connection_errors_threshold      = optional(number, 1)    # Total connection errors to trigger alert (e.g., 1 = >= 1)<br>    alb_connection_errors_pending_period = optional(string, "2m") # How long errors must persist before alerting<br>    alb_connection_errors_dashboard_uid  = optional(string, "")<br>    alb_connection_errors_panel_id       = optional(string, "")<br>  }))</pre> | n/a | yes |
| <a name="input_notification_policy_uid"></a> [notification\_policy\_uid](#input\_notification\_policy\_uid) | UID of the contact point for notifications | `string` | `""` | no |
| <a name="input_runbook_url"></a> [runbook\_url](#input\_runbook\_url) | URL of the runbook for the alert | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_connection_errors_rule_uids"></a> [alb\_connection\_errors\_rule\_uids](#output\_alb\_connection\_errors\_rule\_uids) | n/a |
| <a name="output_ecs_cpu_utilization_rule_uids"></a> [ecs\_cpu\_utilization\_rule\_uids](#output\_ecs\_cpu\_utilization\_rule\_uids) | n/a |
| <a name="output_ecs_memory_utilization_rule_uids"></a> [ecs\_memory\_utilization\_rule\_uids](#output\_ecs\_memory\_utilization\_rule\_uids) | n/a |
| <a name="output_target_5xx_error_rate_rule_uids"></a> [target\_5xx\_error\_rate\_rule\_uids](#output\_target\_5xx\_error\_rate\_rule\_uids) | n/a |
| <a name="output_target_latency_rule_uids"></a> [target\_latency\_rule\_uids](#output\_target\_latency\_rule\_uids) | n/a |
| <a name="output_unhealthy_host_count_rule_uids"></a> [unhealthy\_host\_count\_rule\_uids](#output\_unhealthy\_host\_count\_rule\_uids) | n/a |
| <a name="output_unhealthy_host_percentage_rule_uids"></a> [unhealthy\_host\_percentage\_rule\_uids](#output\_unhealthy\_host\_percentage\_rule\_uids) | n/a |
<!-- END_TF_DOCS -->