locals {
  cluster_query               = var.cluster_query
  cloudwatch_data_source_name = var.cloudwatch_data_source_name
  dashboard_uid               = var.dashboard_uid
  datasource_regex            = "/^${var.cloudwatch_data_source_name}/"
  regions                     = var.region_query
}

data "template_file" "this" {
  template = templatefile("${path.module}/templates/fargatedashboard.json.tpl",
    {
      cloudwatch_data_source_name = local.cloudwatch_data_source_name
      datasource_regex            = local.datasource_regex
      dashboard_uid               = local.dashboard_uid
      cluster_query_string        = join(", ", local.cluster_query)
      region_query_string         = join(", ", local.regions)
      datasource                  = local.cloudwatch_data_source_name
  })
}

resource "random_string" "this" {
  count   = var.create_folder ? 1 : 0
  length  = 5
  special = false
  upper   = true
  lower   = true
  numeric = true
}

resource "grafana_folder" "this" {
  count                        = var.create_folder ? 1 : 0
  title                        = "${var.dashboard_uid}-${random_string.this[0].result}"
  uid                          = "${var.dashboard_uid}-${random_string.this[0].result}-uid"
  prevent_destroy_if_not_empty = var.prevent_destroy_if_not_empty
}

resource "grafana_dashboard" "this" {
  config_json = data.template_file.this.rendered
  folder      = var.create_folder == true ? grafana_folder.this[0].uid : var.folder
  overwrite   = var.enable_overwrite_dashboard
}
