# ECS Container Insights resource utilization alert (memory and CPU)
# Alerts when avg utilization is high for extended period, indicating autoscaling issues

resource "grafana_rule_group" "ecs_memory_utilization" {
  for_each = local.alert_configs

  org_id           = 1
  name             = "ECS Memory Utilization - ${each.key}"
  folder_uid       = var.alert_folder_uid
  interval_seconds = 60

  rule {
    name      = "ECS Memory Utilization - ${each.key}"
    condition = "threshold_check"

    # Query for MemoryUtilization from Container Insights
    data {
      ref_id         = "memory_utilization"
      datasource_uid = each.value.uid

      relative_time_range {
        from = 300
        to   = 0
      }

      model = jsonencode(merge({
        type       = "timeSeriesQuery"
        namespace  = "AWS/ECS"
        metricName = "MemoryUtilization"
        region     = each.value.region
        statistic  = "Average"
        period     = "60"
        id         = "m1"
        }, each.value.ecs_cluster_name != null && each.value.ecs_service_name != null ? {
        dimensions = {
          ClusterName = each.value.ecs_cluster_name
          ServiceName = each.value.ecs_service_name
        }
        } : each.value.ecs_cluster_name != null ? {
        dimensions = {
          ClusterName = each.value.ecs_cluster_name
        }
        matchExact = false
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
        expression = "memory_utilization"
        reducer    = "mean"
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
            params = [each.value.ecs_memory_utilization_threshold]
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

    for            = each.value.ecs_memory_utilization_pending_period
    no_data_state  = "NoData"
    exec_err_state = "Error"

    labels = {
      severity   = "warning"
      datasource = each.key
      region     = each.value.region
      alert_type = "ecs_memory_utilization"
    }

    annotations = {
      summary          = "High ECS memory utilization in ${each.key}"
      description      = "Average memory utilization is {{ $values.reduced }}% - autoscaling may not be functioning properly"
      runbook_url      = var.runbook_url
      __dashboardUid__ = each.value.ecs_memory_utilization_dashboard_uid
      __panelId__      = each.value.ecs_memory_utilization_panel_id
    }
  }
}

resource "grafana_rule_group" "ecs_cpu_utilization" {
  for_each = local.alert_configs

  org_id           = 1
  name             = "ECS CPU Utilization - ${each.key}"
  folder_uid       = var.alert_folder_uid
  interval_seconds = 60

  rule {
    name      = "ECS CPU Utilization - ${each.key}"
    condition = "threshold_check"

    # Query for CPUUtilization from Container Insights
    data {
      ref_id         = "cpu_utilization"
      datasource_uid = each.value.uid

      relative_time_range {
        from = 300
        to   = 0
      }

      model = jsonencode(merge({
        type       = "timeSeriesQuery"
        namespace  = "AWS/ECS"
        metricName = "CPUUtilization"
        region     = each.value.region
        statistic  = "Average"
        period     = "60"
        id         = "m1"
        }, each.value.ecs_cluster_name != null && each.value.ecs_service_name != null ? {
        dimensions = {
          ClusterName = each.value.ecs_cluster_name
          ServiceName = each.value.ecs_service_name
        }
        } : each.value.ecs_cluster_name != null ? {
        dimensions = {
          ClusterName = each.value.ecs_cluster_name
        }
        matchExact = false
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
        expression = "cpu_utilization"
        reducer    = "mean"
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
            params = [each.value.ecs_cpu_utilization_threshold]
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

    for            = each.value.ecs_cpu_utilization_pending_period
    no_data_state  = "NoData"
    exec_err_state = "Error"

    labels = {
      severity   = "warning"
      datasource = each.key
      region     = each.value.region
      alert_type = "ecs_cpu_utilization"
    }

    annotations = {
      summary          = "High ECS CPU utilization in ${each.key}"
      description      = "Average CPU utilization is {{ $values.reduced }}% - autoscaling may not be functioning properly"
      runbook_url      = var.runbook_url
      __dashboardUid__ = each.value.ecs_cpu_utilization_dashboard_uid
      __panelId__      = each.value.ecs_cpu_utilization_panel_id
    }
  }
}

output "ecs_memory_utilization_rule_uids" {
  value = {
    for k, v in grafana_rule_group.ecs_memory_utilization : k => v.uid
  }
}

output "ecs_cpu_utilization_rule_uids" {
  value = {
    for k, v in grafana_rule_group.ecs_cpu_utilization : k => v.uid
  }
}
