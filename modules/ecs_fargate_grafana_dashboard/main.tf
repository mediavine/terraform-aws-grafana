locals {
  cluster_query = var.cluster_query
  cloudwatch_data_source_name = var.cloudwatch_data_source_name
  dashboard_uid = var.dashboard_uid
  datasource_regex = "/^${var.cloudwatch_data_source_name}/"
  regions = var.region_query
}

locals {
  cluster_options = jsonencode([
    for cluster in local.cluster_query : {
      "selected": false,
      "text": cluster,
      "value": cluster
    }
  ])
}

locals {
  region_options = jsonencode([
    for region in local.regions : {
      "selected": false,
      "text": region,
      "value": region
    }
  ])
}

data "template_file" "this" {
  template = templatefile("${path.module}/templates/cloudtrail-dashboard.json.tpl",
  {
    cluster_options        = local.cluster_options
    datasource_regex       = local.datasource_regex
    dashboard_uid          = local.dashboard_uid
    cluster_query_string   = join(", ", local.cluster_query)
    region_options         = local.region_options
    region_query_string    = join(", ", local.regions)
  }
  )
}
