## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |
| <a name="requirement_grafana"></a> [grafana](#requirement\_grafana) | 2.8.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | 2.8.1 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [grafana_dashboard.this](https://registry.terraform.io/providers/grafana/grafana/2.8.1/docs/resources/dashboard) | resource |
| [grafana_folder.this](https://registry.terraform.io/providers/grafana/grafana/2.8.1/docs/resources/folder) | resource |
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [template_file.this](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_folder"></a> [create\_folder](#input\_create\_folder) | create a folder for the dashboard | `bool` | `false` | no |
| <a name="input_dashboard_uid"></a> [dashboard\_uid](#input\_dashboard\_uid) | unique identifier for the dashboard | `string` | `"Postgres-Dashboard"` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | name of the database | `string` | n/a | yes |
| <a name="input_dbinstanceidentifier"></a> [dbinstanceidentifier](#input\_dbinstanceidentifier) | DB instance identity of the RDS instance | `list(string)` | n/a | yes |
| <a name="input_enable_overwrite_dashboard"></a> [enable\_overwrite\_dashboard](#input\_enable\_overwrite\_dashboard) | overwrite the dashboard if it exists | `bool` | `false` | no |
| <a name="input_folder"></a> [folder](#input\_folder) | folder to place the dashboard in | `string` | `""` | no |
| <a name="input_grafana_api_token"></a> [grafana\_api\_token](#input\_grafana\_api\_token) | API token for Grafana | `string` | n/a | yes |
| <a name="input_postgres_data_source_name"></a> [postgres\_data\_source\_name](#input\_postgres\_data\_source\_name) | name of the postgres data source | `string` | `"postgres"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
README.MD updated successfully
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |
| <a name="requirement_grafana"></a> [grafana](#requirement\_grafana) | 2.19.4 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.6.3 |
| <a name="requirement_template"></a> [template](#requirement\_template) | >= 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | 2.19.4 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.6.3 |
| <a name="provider_template"></a> [template](#provider\_template) | >= 2.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [grafana_dashboard.this](https://registry.terraform.io/providers/grafana/grafana/2.19.4/docs/resources/dashboard) | resource |
| [grafana_folder.this](https://registry.terraform.io/providers/grafana/grafana/2.19.4/docs/resources/folder) | resource |
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [template_file.this](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_folder"></a> [create\_folder](#input\_create\_folder) | create a folder for the dashboard | `bool` | `false` | no |
| <a name="input_dashboard_uid"></a> [dashboard\_uid](#input\_dashboard\_uid) | unique identifier for the dashboard | `string` | `"Postgres-Dashboard"` | no |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | name of the database | `string` | n/a | yes |
| <a name="input_dbinstanceidentifier"></a> [dbinstanceidentifier](#input\_dbinstanceidentifier) | DB instance identity of the RDS instance | `list(string)` | n/a | yes |
| <a name="input_enable_overwrite_dashboard"></a> [enable\_overwrite\_dashboard](#input\_enable\_overwrite\_dashboard) | overwrite the dashboard if it exists | `bool` | `false` | no |
| <a name="input_folder"></a> [folder](#input\_folder) | folder to place the dashboard in | `string` | `""` | no |
| <a name="input_grafana_cloud_api_token"></a> [grafana\_cloud\_api\_token](#input\_grafana\_cloud\_api\_token) | API token for Grafana Cloud | `string` | n/a | yes |
| <a name="input_parent_folder_uid"></a> [parent\_folder\_uid](#input\_parent\_folder\_uid) | parent folder uid | `string` | `""` | no |
| <a name="input_postgres_data_source_name"></a> [postgres\_data\_source\_name](#input\_postgres\_data\_source\_name) | name of the postgres data source | `string` | `"postgres"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
