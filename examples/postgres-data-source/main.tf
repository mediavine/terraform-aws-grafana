module "this" {
  source = "../../modules/postgres_grafana_datasource"

  # region                   = var.region //This is not used in the module
  grafana_data_source_name = var.grafana_data_source_name
  grafana_api_token        = data.aws_ssm_parameter.grafana_token.value

  host                = data.aws_ssm_parameter.host.value
  user                = data.aws_ssm_parameter.new_username.value  #new username for user that is being created
  password            = data.aws_ssm_parameter.new_password.value  #new pwd for user that is being created
  database            = data.aws_ssm_parameter.database_name.value #name of database in grafana datasource
  sslmode             = "require"
  max_open_conns      = 10
  max_idle_conns      = 2
  max_idle_conns_auto = true
  conn_max_lifetime   = 1
  postgres_version    = 1500
  timescaledb         = true
  time_interval       = "2m"
  expected_version    = 15.6 #For postgres provider. This is a required hint in order for Terraform to talk with an ancient version of PostgreSQL. This parameter is expected to be a PostgreSQL Version or current.

  #user to connect to db that already exists
  master_password       = data.aws_ssm_parameter.master_password.value
  master_username       = data.aws_ssm_parameter.master_username.value
  primary_database_name = data.aws_ssm_parameter.primary_database_name.value
  primary_host          = data.aws_ssm_parameter.primary_host.value
}

module "that" {
  source = "../../modules/postgres_grafana_dashboard"

  postgres_data_source_name = module.this.grafana_data_source_name
  dashboard_uid             = "sandbox-postgres"
  create_folder             = true
  grafana_api_token         = data.aws_ssm_parameter.grafana_token.value
  region                    = ["us-east-1", "us-west-1", "us-west-2"]
  dbinstanceidentifier      = data.aws_ssm_parameter.db_identifier.value
  database_name             = data.aws_ssm_parameter.database_name.value
}


data "aws_ssm_parameter" "master_password" {
  name = "/test/datasource/master_pwd"
}

data "aws_ssm_parameter" "master_username" {
  name = "/test/datasource/master_user"
}

data "aws_ssm_parameter" "new_password" {
  name = "/test/datasource/new_pwd"
}

data "aws_ssm_parameter" "new_username" {
  name = "/test/datasource/new_user"
}

data "aws_ssm_parameter" "host" {
  name = "/test/datasource/host"
}

data "aws_ssm_parameter" "grafana_token" {
  name = "/test/datasource/grafana_token"
}

data "aws_ssm_parameter" "database_name" {
  name = "/test/datasource/db_name"
}

data "aws_ssm_parameter" "db_identifier" {
  name = "/test/datasource/db_identifier"
}

data "aws_ssm_parameter" "primary_host" {
  name = "/test/datasource/primary_host"
}

data "aws_ssm_parameter" "primary_database_name" {
  name = "/test/datasource/primary_database_name"
}
