# Unhealthy host count alert (count-based, longer pending period)
resource "grafana_rule_group" "unhealthy_host_count" {
  for_each = local.alert_configs

  org_id           = 1
  name             = "Unhealthy Host Count - ${each.key}"
  folder_uid       = var.alert_folder_uid
  interval_seconds = 60

  rule {
    name      = "Unhealthy Host Count - ${each.key}"
    condition = "threshold_check"

    # Query for UnHealthyHostCount
    data {
      ref_id         = "unhealthy_count"
      datasource_uid = each.value.uid

      relative_time_range {
        from = 60
        to   = 0
      }

      model = jsonencode(merge({
        type       = "timeSeriesQuery"
        namespace  = "AWS/ApplicationELB"
        metricName = "UnHealthyHostCount"
        region     = each.value.region
        statistic  = "Maximum"
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
        expression = "unhealthy_count"
        reducer    = "last"
        settings = {
          mode = "dropNN"
        }
      })
    }

    # Threshold condition (count-based)
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
            params = [each.value.unhealthy_host_count_threshold - 1] # >= threshold
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

    for            = each.value.unhealthy_host_count_pending_period
    no_data_state  = "NoData"
    exec_err_state = "Error"

    labels = {
      severity   = "critical"
      datasource = each.key
      region     = each.value.region
      alert_type = "unhealthy_host_count"
    }

    annotations = {
      summary          = "Unhealthy host count exceeded in ${each.key}"
      description      = "{{ $values.reduced }} unhealthy host(s) for extended period in target group"
      runbook_url      = var.runbook_url
      __dashboardUid__ = each.value.unhealthy_host_count_dashboard_uid
      __panelId__      = each.value.unhealthy_host_count_panel_id
    }
  }
}

output "unhealthy_host_count_rule_uids" {
  value = {
    for k, v in grafana_rule_group.unhealthy_host_count : k => v.uid
  }
}
