# ecs_fargate_grafana_dashboard

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
| <a name="input_cloudwatch_data_source_name"></a> [cloudwatch\_data\_source\_name](#input\_cloudwatch\_data\_source\_name) | name of the cloudwatch data source | `string` | `"cloudwatch"` | no |
| <a name="input_cluster_query"></a> [cluster\_query](#input\_cluster\_query) | name of queriable ECS clusters | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_create_folder"></a> [create\_folder](#input\_create\_folder) | create a folder for the dashboard | `bool` | `false` | no |
| <a name="input_dashboard_uid"></a> [dashboard\_uid](#input\_dashboard\_uid) | unique identifier for the dashboard | `string` | `"cloudwatch-dashboard"` | no |
| <a name="input_enable_overwrite_dashboard"></a> [enable\_overwrite\_dashboard](#input\_enable\_overwrite\_dashboard) | overwrite the dashboard if it exists | `bool` | `false` | no |
| <a name="input_folder"></a> [folder](#input\_folder) | folder to place the dashboard in | `string` | `""` | no |
| <a name="input_grafana_cloud_api_token"></a> [grafana\_cloud\_api\_token](#input\_grafana\_cloud\_api\_token) | API token for Grafana Cloud | `string` | n/a | yes |
| <a name="input_parent_folder_uid"></a> [parent\_folder\_uid](#input\_parent\_folder\_uid) | parent folder uid | `string` | `""` | no |
| <a name="input_prevent_destroy_if_not_empty"></a> [prevent\_destroy\_if\_not\_empty](#input\_prevent\_destroy\_if\_not\_empty) | used for the grafana folder resource | `bool` | `true` | no |
| <a name="input_region_query"></a> [region\_query](#input\_region\_query) | name of queriable regions | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_grafana_dashboard_id"></a> [grafana\_dashboard\_id](#output\_grafana\_dashboard\_id) | (Number) The numeric ID of the dashboard computed by Grafana |
| <a name="output_grafana_dashboard_resource_id"></a> [grafana\_dashboard\_resource\_id](#output\_grafana\_dashboard\_resource\_id) | (String) The ID of this resource. |
| <a name="output_grafana_dashboard_uid"></a> [grafana\_dashboard\_uid](#output\_grafana\_dashboard\_uid) | (String) The unique identifier of a dashboard. This is used to construct its URL. It's automatically generated if not provided when creating a dashboard. The uid allows having consistent URLs for accessing dashboards and when syncing dashboards between multiple Grafana installs. |
| <a name="output_grafana_dashboard_url"></a> [grafana\_dashboard\_url](#output\_grafana\_dashboard\_url) | (String) The URL of the dashboard in Grafana |
| <a name="output_grafana_dashboard_version"></a> [grafana\_dashboard\_version](#output\_grafana\_dashboard\_version) | (Number) Whenever you save a version of your dashboard, a copy of that version is saved so that previous versions of your dashboard are not lost. |
<!-- END_TF_DOCS -->
