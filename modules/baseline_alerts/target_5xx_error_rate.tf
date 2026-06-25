# Target 5xx error rate alert (percentage of requests returning 5xx)
resource "grafana_rule_group" "target_5xx_error_rate" {
  for_each = local.alert_configs

  org_id           = 1
  name             = "Target 5xx Error Rate - ${each.key}"
  folder_uid       = var.alert_folder_uid
  interval_seconds = 60

  rule {
    name      = "Target 5xx Error Rate - ${each.key}"
    condition = "threshold_check"

    # Query for HTTPCode_Target_5XX_Count
    data {
      ref_id         = "target_5xx"
      datasource_uid = each.value.uid

      relative_time_range {
        from = 60
        to   = 0
      }

      model = jsonencode(merge({
        type       = "timeSeriesQuery"
        namespace  = "AWS/ApplicationELB"
        metricName = "HTTPCode_Target_5XX_Count"
        region     = each.value.region
        statistic  = "Sum"
        period     = "60"
        id         = "m1"
        }, each.value.load_balancer_id != null && each.value.target_group_id != null ? {
        dimensions = {
          LoadBalancer = each.value.load_balancer_id
          TargetGroup  = each.value.target_group_id
        }
        } : {
        matchExact = false
        dimensions = {}
        }
      ))
    }

    # Query for RequestCount
    data {
      ref_id         = "request_count"
      datasource_uid = each.value.uid

      relative_time_range {
        from = 60
        to   = 0
      }

      model = jsonencode(merge({
        type       = "timeSeriesQuery"
        namespace  = "AWS/ApplicationELB"
        metricName = "RequestCount"
        region     = each.value.region
        statistic  = "Sum"
        period     = "60"
        id         = "m2"
        }, each.value.load_balancer_id != null && each.value.target_group_id != null ? {
        dimensions = {
          LoadBalancer = each.value.load_balancer_id
          TargetGroup  = each.value.target_group_id
        }
        } : {
        matchExact = false
        dimensions = {}
        }
      ))
    }

    # Calculate error rate percentage: (5xx / total requests) * 100
    data {
      ref_id         = "error_rate"
      datasource_uid = "-100"

      relative_time_range {
        from = 0
        to   = 0
      }

      model = jsonencode({
        type       = "math"
        expression = "($target_5xx / $request_count) * 100"
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
        expression = "error_rate"
        reducer    = "last"
        settings = {
          mode = "dropNN"
        }
      })
    }

    # Threshold condition (percentage)
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
            params = [each.value.target_5xx_error_rate_threshold]
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

    for            = each.value.target_5xx_error_rate_pending_period
    no_data_state  = "NoData"
    exec_err_state = "Error"

    labels = {
      severity   = "critical"
      datasource = each.key
      region     = each.value.region
      alert_type = "target_5xx_error_rate"
    }

    annotations = {
      summary          = "High target 5xx error rate in ${each.key}"
      description      = "{{ $values.reduced }}% of requests are returning 5xx errors"
      runbook_url      = var.runbook_url
      __dashboardUid__ = each.value.target_5xx_error_rate_dashboard_uid
      __panelId__      = each.value.target_5xx_error_rate_panel_id
    }
  }
}

output "target_5xx_error_rate_rule_uids" {
  value = {
    for k, v in grafana_rule_group.target_5xx_error_rate : k => v.uid
  }
}
