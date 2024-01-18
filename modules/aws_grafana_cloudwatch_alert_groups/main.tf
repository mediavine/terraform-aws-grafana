resource "grafana_rule_group" "this" {
  org_id           = var.org_id
  name             = var.rule_group_name
  folder_uid       = var.folder_uid
  interval_seconds = 60

  rule {
    name      = var.rule_name
    condition = "B"

    data {
      ref_id = "A"

      relative_time_range {
        from = var.alert_duration
        to   = 0
      }

      datasource_uid = var.datasource_uid
      model = jsonencode({
        alias         = ""
        dimensions    = var.metric_dimensions
        expression    = ""
        id            = ""
        intervalMs    = 200
        matchExact    = true
        maxDataPoints = 1500
        metricName    = var.cloudwatch_metric_name
        namespace     = var.cloudwatch_namespace
        period        = ""
        refId         = "A"
        region        = var.data_source_aws_region
        statistics    = var.statistics
      })
    }
    data {
      ref_id = "B"

      relative_time_range {
        from = 0
        to   = 0
      }

      datasource_uid = "__expr__"
      model = jsonencode({
        conditions = [
          {
            evaluator = {
              params = var.evaluator_threshold
              type   = var.evaluator_type
            }
            operator = {
              type = "and"
            }
            query = {
              params = ["A"]
            }
            reducer = {
              type = var.reducer_type
            }
          }
        ]
        intervalMs    = 1000
        maxDataPoints = 43200
        refId         = "B"
        type          = "classic_conditions"
      })
    }

    no_data_state  = "NoData"
    exec_err_state = "Alerting"
    for            = var.alert_duration
    annotations = {
      __alertId__      = var.alert_id
      message          = var.alert_message
    }
    labels = {
      rule_uid = var.rule_uid
    }
    is_paused = false
  }
}
