resource "grafana_data_source" "postgres" {
  name     = "${var.grafana_data_source_name}-postgres"
  type     = "postgres"
  username = var.user
  url      = var.host

  #for sensitive data
  secure_json_data_encoded = jsonencode({
    password = var.password
  })

  json_data_encoded = jsonencode({
    database         = var.database
    sslmode          = var.sslmode
    maxOpenConns     = var.max_open_conns
    maxIdleConns     = var.max_idle_conns
    maxIdleConnsAuto = var.max_idle_conns_auto
    connMaxLifetime  = var.conn_max_lifetime
    postgresVersion  = var.postgres_version
    timescaledb      = var.timescaledb
    timeInterval     = var.time_interval
  })
}

#Create user/pwd for grafana postgres datasource
resource "postgresql_role" "grafana_read_only_user" {
  name     = var.user
  login    = true
  password = var.password
  roles    = ["pg_read_all_data", "pg_monitor", "pg_read_all_settings", "pg_read_all_stats"] #existing roles in postgres but can be adjusted
}

#Grant read only permissions on table, can be adjusted accordingly
resource "postgresql_grant" "grant_grafana_read_only" {
  database    = var.database
  role        = postgresql_role.grafana_read_only_user.name
  schema      = "public"
  object_type = "table"
  privileges  = ["SELECT"]
}
