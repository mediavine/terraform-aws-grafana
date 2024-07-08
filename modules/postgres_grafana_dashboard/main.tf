locals {
  postgres_data_source_name   = var.postgres_data_source_name
  regions                     = var.region
  dbinstanceidentifier        = var.dbinstanceidentifier
  dashboard_uid               = var.dashboard_uid
  datasource_regex            = "/^${var.postgres_data_source_name}/"
  database_name               = var.database_name
}


data "template_file" "this" {
  template = templatefile("${path.module}/templates/postgresdashboard.json.tpl",
    {
      postgres_data_source_name   = local.postgres_data_source_name
      region_query_string         = join(", ", local.regions)
      dashboard_uid               = local.dashboard_uid
      dbinstanceidentifier        = join(", ", local.dbinstanceidentifier)
      datasource_regex            = local.datasource_regex
      database_name               = local.database_name
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
  prevent_destroy_if_not_empty = true
}

resource "grafana_dashboard" "this" {
  config_json = data.template_file.this.rendered
  folder      = var.create_folder == true ? grafana_folder.this[0].uid : var.folder
  overwrite   = var.enable_overwrite_dashboard
}
