locals {
  # Flatten for easier iteration if needed
  alert_configs = {
    for name, ds in var.datasources : name => merge(ds, {
      alert_name = "Unhealthy Host Count - ${name}"
    })
  }
}

resource "grafana_rule_group" "unhealthy_host_percentage" {
  for_each = local.alert_configs

  org_id           = 1
  name             = "Unhealthy Host Percentage - ${each.key}"
  folder_uid       = var.alert_folder_uid
  interval_seconds = 60

  rule {
    name      = "Unhealthy Host Percentage - ${each.key}"
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

    # Query for HealthyHostCount
    data {
      ref_id         = "healthy_count"
      datasource_uid = each.value.uid

      relative_time_range {
        from = 60
        to   = 0
      }

      model = jsonencode(merge({
        type       = "timeSeriesQuery"
        namespace  = "AWS/ApplicationELB"
        metricName = "HealthyHostCount"
        region     = each.value.region
        statistic  = "Minimum"
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

    # Calculate percentage: (unhealthy / (unhealthy + healthy)) * 100
    data {
      ref_id         = "unhealthy_percent"
      datasource_uid = "-100"

      relative_time_range {
        from = 0
        to   = 0
      }

      model = jsonencode({
        type       = "math"
        expression = "($unhealthy_count / ($unhealthy_count + $healthy_count)) * 100"
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
        expression = "unhealthy_percent"
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
            params = [each.value.unhealthy_host_percentage_threshold] # Percentage threshold, e.g., 25 for >25%
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

    for            = each.value.unhealthy_host_percentage_pending_period
    no_data_state  = "NoData"
    exec_err_state = "Error"

    labels = {
      severity   = "warning"
      datasource = each.key
      region     = each.value.region
      alert_type = "unhealthy_host_percentage"
    }

    annotations = {
      summary          = "Unhealthy host percentage exceeded in ${each.key}"
      description      = "{{ $values.reduced }}% of hosts are unhealthy in target group"
      runbook_url      = var.runbook_url
      __dashboardUid__ = each.value.unhealthy_host_percentage_dashboard_uid
      __panelId__      = each.value.unhealthy_host_percentage_panel_id
    }
  }
}

output "unhealthy_host_percentage_rule_uids" {
  value = {
    for k, v in grafana_rule_group.unhealthy_host_percentage : k => v.uid
  }
}
