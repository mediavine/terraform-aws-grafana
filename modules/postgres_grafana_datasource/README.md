## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |
| <a name="requirement_grafana"></a> [grafana](#requirement\_grafana) | 2.8.1 |
| <a name="requirement_postgresql"></a> [postgresql](#requirement\_postgresql) | 1.22.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | 2.8.1 |
| <a name="provider_postgresql"></a> [postgresql](#provider\_postgresql) | 1.22.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [grafana_data_source.postgres](https://registry.terraform.io/providers/grafana/grafana/2.8.1/docs/resources/data_source) | resource |
| [postgresql_grant.grant_grafana_read_only](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.22.0/docs/resources/grant) | resource |
| [postgresql_role.grafana_read_only_user](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.22.0/docs/resources/role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_conn_max_lifetime"></a> [conn\_max\_lifetime](#input\_conn\_max\_lifetime) | The maximum amount of time in seconds a connection may be reused | `number` | n/a | yes |
| <a name="input_database"></a> [database](#input\_database) | Name of the database | `string` | n/a | yes |
| <a name="input_expected_version"></a> [expected\_version](#input\_expected\_version) | version of the database | `string` | n/a | yes |
| <a name="input_grafana_api_token"></a> [grafana\_api\_token](#input\_grafana\_api\_token) | API token for Grafana | `string` | n/a | yes |
| <a name="input_grafana_data_source_name"></a> [grafana\_data\_source\_name](#input\_grafana\_data\_source\_name) | value of the grafana data source name | `string` | n/a | yes |
| <a name="input_host"></a> [host](#input\_host) | Host of the database | `string` | n/a | yes |
| <a name="input_master_password"></a> [master\_password](#input\_master\_password) | Password used to connect to existing database user | `string` | n/a | yes |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | Username used to connect to existing database user | `string` | n/a | yes |
| <a name="input_max_idle_conns"></a> [max\_idle\_conns](#input\_max\_idle\_conns) | The maximum number of connections in the idle connection pool | `number` | n/a | yes |
| <a name="input_max_idle_conns_auto"></a> [max\_idle\_conns\_auto](#input\_max\_idle\_conns\_auto) | Determines whether the connection pool will automatically shrink and grow based on demand | `bool` | n/a | yes |
| <a name="input_max_open_conns"></a> [max\_open\_conns](#input\_max\_open\_conns) | The maximum number of open connections to the database | `number` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | Password for the user of the datasource | `string` | n/a | yes |
| <a name="input_port"></a> [port](#input\_port) | Port of the database | `number` | `5432` | no |
| <a name="input_postgres_version"></a> [postgres\_version](#input\_postgres\_version) | postgres version | `number` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | n/a | yes |
| <a name="input_sslmode"></a> [sslmode](#input\_sslmode) | Determines whether or with what priority a secure SSL TCP/IP connection will be negotiated with the server | `string` | n/a | yes |
| <a name="input_time_interval"></a> [time\_interval](#input\_time\_interval) | Time interval | `string` | n/a | yes |
| <a name="input_timescaledb"></a> [timescaledb](#input\_timescaledb) | Determines whether the data source is a TimescaleDB | `bool` | n/a | yes |
| <a name="input_user"></a> [user](#input\_user) | Username for the user of the datasource | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_grafana_data_source_name"></a> [grafana\_data\_source\_name](#output\_grafana\_data\_source\_name) | name of the postgres datasource |
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.MD updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |
| <a name="requirement_grafana"></a> [grafana](#requirement\_grafana) | 3.17.0 |
| <a name="requirement_postgresql"></a> [postgresql](#requirement\_postgresql) | 1.22.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | 3.17.0 |
| <a name="provider_postgresql"></a> [postgresql](#provider\_postgresql) | 1.22.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [grafana_data_source.postgres](https://registry.terraform.io/providers/grafana/grafana/3.17.0/docs/resources/data_source) | resource |
| [postgresql_grant.grant_grafana_read_only](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.22.0/docs/resources/grant) | resource |
| [postgresql_role.grafana_read_only_user](https://registry.terraform.io/providers/cyrilgdn/postgresql/1.22.0/docs/resources/role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_conn_max_lifetime"></a> [conn\_max\_lifetime](#input\_conn\_max\_lifetime) | The maximum amount of time in seconds a connection may be reused | `number` | n/a | yes |
| <a name="input_database"></a> [database](#input\_database) | Name of the database | `string` | n/a | yes |
| <a name="input_expected_version"></a> [expected\_version](#input\_expected\_version) | version of the database | `string` | n/a | yes |
| <a name="input_grafana_cloud_api_token"></a> [grafana\_cloud\_api\_token](#input\_grafana\_cloud\_api\_token) | API token for Grafana Cloud | `string` | n/a | yes |
| <a name="input_grafana_data_source_name"></a> [grafana\_data\_source\_name](#input\_grafana\_data\_source\_name) | value of the grafana data source name | `string` | n/a | yes |
| <a name="input_host"></a> [host](#input\_host) | Host of the database | `string` | n/a | yes |
| <a name="input_master_password"></a> [master\_password](#input\_master\_password) | Password used to connect to existing database user | `string` | n/a | yes |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | Username used to connect to existing database user | `string` | n/a | yes |
| <a name="input_max_idle_conns"></a> [max\_idle\_conns](#input\_max\_idle\_conns) | The maximum number of connections in the idle connection pool | `number` | n/a | yes |
| <a name="input_max_idle_conns_auto"></a> [max\_idle\_conns\_auto](#input\_max\_idle\_conns\_auto) | Determines whether the connection pool will automatically shrink and grow based on demand | `bool` | n/a | yes |
| <a name="input_max_open_conns"></a> [max\_open\_conns](#input\_max\_open\_conns) | The maximum number of open connections to the database | `number` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | Password for the user of the datasource | `string` | n/a | yes |
| <a name="input_port"></a> [port](#input\_port) | Port of the database | `number` | `5432` | no |
| <a name="input_postgres_version"></a> [postgres\_version](#input\_postgres\_version) | postgres version | `number` | n/a | yes |
| <a name="input_primary_database_name"></a> [primary\_database\_name](#input\_primary\_database\_name) | Name of the primary database that creates the grafana read only user | `string` | n/a | yes |
| <a name="input_primary_host"></a> [primary\_host](#input\_primary\_host) | Host of the primary database hat creates the grafana read only user | `string` | n/a | yes |
| <a name="input_sslmode"></a> [sslmode](#input\_sslmode) | Determines whether or with what priority a secure SSL TCP/IP connection will be negotiated with the server | `string` | n/a | yes |
| <a name="input_time_interval"></a> [time\_interval](#input\_time\_interval) | Time interval | `string` | n/a | yes |
| <a name="input_timescaledb"></a> [timescaledb](#input\_timescaledb) | Determines whether the data source is a TimescaleDB | `bool` | n/a | yes |
| <a name="input_user"></a> [user](#input\_user) | Username for the user of the datasource | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_grafana_data_source_name"></a> [grafana\_data\_source\_name](#output\_grafana\_data\_source\_name) | name of the postgres datasource |
<!-- END_TF_DOCS -->
