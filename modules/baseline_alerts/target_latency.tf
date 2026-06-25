# Target latency alert
resource "grafana_rule_group" "target_latency" {
  for_each = local.alert_configs

  org_id           = 1
  name             = "Target Latency - ${each.key}"
  folder_uid       = var.alert_folder_uid
  interval_seconds = 60

  rule {
    name      = "Target Latency - ${each.key}"
    condition = "threshold_check"

    # Query for TargetResponseTime (returns seconds)
    data {
      ref_id         = "target_latency"
      datasource_uid = each.value.uid

      relative_time_range {
        from = 60
        to   = 0
      }

      model = jsonencode(merge({
        type       = "timeSeriesQuery"
        namespace  = "AWS/ApplicationELB"
        metricName = "TargetResponseTime"
        region     = each.value.region
        statistic  = "Average"
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

    # Convert latency to milliseconds (CloudWatch returns seconds)
    data {
      ref_id         = "latency_ms"
      datasource_uid = "-100"

      relative_time_range {
        from = 0
        to   = 0
      }

      model = jsonencode({
        type       = "math"
        expression = "$target_latency * 1000"
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
        expression = "latency_ms"
        reducer    = "last"
        settings = {
          mode = "dropNN"
        }
      })
    }

    # Threshold condition (in milliseconds)
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
            params = [each.value.target_latency_threshold_ms]
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

    for            = each.value.target_latency_pending_period
    no_data_state  = "NoData"
    exec_err_state = "Error"

    labels = {
      severity   = "warning"
      datasource = each.key
      region     = each.value.region
      alert_type = "target_latency"
    }

    annotations = {
      summary          = "High target latency in ${each.key}"
      description      = "Target latency is {{ $values.reduced }}ms"
      runbook_url      = var.runbook_url
      __dashboardUid__ = each.value.target_latency_dashboard_uid
      __panelId__      = each.value.target_latency_panel_id
    }
  }
}

output "target_latency_rule_uids" {
  value = {
    for k, v in grafana_rule_group.target_latency : k => v.uid
  }
}
