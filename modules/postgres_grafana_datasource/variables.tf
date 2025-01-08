variable "grafana_cloud_api_token" {
  type        = string
  description = "API token for Grafana Cloud"
}

variable "grafana_data_source_name" {
  type        = string
  description = "value of the grafana data source name"
}

variable "user" {
  type        = string
  description = "Username for the user of the datasource"
}

variable "password" {
  type        = string
  description = "Password for the user of the datasource"
}

variable "database" {
  type        = string
  description = "Name of the database"
}

variable "sslmode" {
  type        = string
  description = "Determines whether or with what priority a secure SSL TCP/IP connection will be negotiated with the server"
}

variable "max_open_conns" {
  type        = number
  description = "The maximum number of open connections to the database"
}

variable "max_idle_conns" {
  type        = number
  description = "The maximum number of connections in the idle connection pool"
}

variable "max_idle_conns_auto" {
  type        = bool
  description = "Determines whether the connection pool will automatically shrink and grow based on demand"
}

variable "conn_max_lifetime" {
  type        = number
  description = "The maximum amount of time in seconds a connection may be reused"
}

variable "postgres_version" {
  type        = number
  description = "postgres version"
}

variable "timescaledb" {
  type        = bool
  description = "Determines whether the data source is a TimescaleDB"
}

variable "time_interval" {
  type        = string
  description = "Time interval"
}

# variable "region" {
#   type        = string
#   description = "AWS region"
# }

variable "host" {
  type        = string
  description = "Host of the database"
}

variable "port" {
  type        = number
  description = "Port of the database"
  default     = 5432
}

variable "expected_version" {
  type        = string
  description = "version of the database"
}

variable "master_username" {
  type        = string
  description = "Username used to connect to existing database user"
}

variable "master_password" {
  type        = string
  description = "Password used to connect to existing database user"
}

variable "primary_database_name" {
  type        = string
  description = "Name of the primary database that creates the grafana read only user"
}

variable "primary_host" {
  type        = string
  description = "Host of the primary database hat creates the grafana read only user"
}
