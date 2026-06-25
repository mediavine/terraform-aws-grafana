# ALB connection errors alert (rejected connections + target connection errors)
resource "grafana_rule_group" "alb_connection_errors" {
  for_each = local.alert_configs

  org_id           = 1
  name             = "ALB Connection Errors - ${each.key}"
  folder_uid       = var.alert_folder_uid
  interval_seconds = 60

  rule {
    name      = "ALB Connection Errors - ${each.key}"
    condition = "threshold_check"

    # Query for RejectedConnectionCount
    data {
      ref_id         = "rejected_connections"
      datasource_uid = each.value.uid

      relative_time_range {
        from = 60
        to   = 0
      }

      model = jsonencode(merge({
        type       = "timeSeriesQuery"
        namespace  = "AWS/ApplicationELB"
        metricName = "RejectedConnectionCount"
        region     = each.value.region
        statistic  = "Sum"
        period     = "60"
        id         = "m1"
        }, each.value.load_balancer_id != null ? {
        dimensions = {
          LoadBalancer = each.value.load_balancer_id
        }
        } : {
        matchExact = false
        dimensions = {}
        }
      ))
    }

    # Query for TargetConnectionErrorCount
    data {
      ref_id         = "target_connection_errors"
      datasource_uid = each.value.uid

      relative_time_range {
        from = 60
        to   = 0
      }

      model = jsonencode(merge({
        type       = "timeSeriesQuery"
        namespace  = "AWS/ApplicationELB"
        metricName = "TargetConnectionErrorCount"
        region     = each.value.region
        statistic  = "Sum"
        period     = "60"
        id         = "m2"
        }, each.value.load_balancer_id != null && each.value.target_group_id != null ? {
        dimensions = {
          LoadBalancer = each.value.load_balancer_id
          TargetGroup  = each.value.target_group_id
        }
        } : each.value.load_balancer_id != null ? {
        dimensions = {
          LoadBalancer = each.value.load_balancer_id
        }
        matchExact = false
        } : {
        matchExact = false
        dimensions = {}
        }
      ))
    }

    # Sum both error types
    data {
      ref_id         = "total_connection_errors"
      datasource_uid = "-100"

      relative_time_range {
        from = 0
        to   = 0
      }

      model = jsonencode({
        type       = "math"
        expression = "$rejected_connections + $target_connection_errors"
      })
    }

    # Reduce to single value
    data {
      ref_id         = "reduced"
      datasource_uid = "-100"

      relative_time_range {
        from = 0
        to   = 0
      }

      model = jsonencode({
        type       = "reduce"
        expression = "total_connection_errors"
        reducer    = "last"
        settings = {
          mode = "dropNN"
        }
      })
    }

    # Threshold condition
    data {
      ref_id         = "threshold_check"
      datasource_uid = "-100"

      relative_time_range {
        from = 0
        to   = 0
      }

      model = jsonencode({
        type       = "threshold"
        expression = "reduced"
        conditions = [{
          evaluator = {
            type   = "gt"
            params = [each.value.alb_connection_errors_threshold - 1] # >= threshold
          }
          operator = {
            type = "and"
          }
          reducer = {
            type = "last"
          }
        }]
      })
    }

    for            = each.value.alb_connection_errors_pending_period
    no_data_state  = "NoData"
    exec_err_state = "Error"

    labels = {
      severity   = "critical"
      datasource = each.key
      region     = each.value.region
      alert_type = "alb_connection_errors"
    }

    annotations = {
      summary          = "ALB connection errors detected in ${each.key}"
      description      = "{{ $values.reduced }} connection errors (rejected + target connection errors)"
      runbook_url      = var.runbook_url
      __dashboardUid__ = each.value.alb_connection_errors_dashboard_uid
      __panelId__      = each.value.alb_connection_errors_panel_id
    }
  }
}

output "alb_connection_errors_rule_uids" {
  value = {
    for k, v in grafana_rule_group.alb_connection_errors : k => v.uid
  }
}
