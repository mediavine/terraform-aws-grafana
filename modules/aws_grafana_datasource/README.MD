# aws_grafana_datasource

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

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | 3.17.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.athena_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_policy.cloudwatch_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.athena_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.aws_xray_read_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.cloudwatch_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.prometheus_query_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.prometheus_remote_write_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [grafana_data_source.amazon_managed_prometheus](https://registry.terraform.io/providers/grafana/grafana/3.17.0/docs/resources/data_source) | resource |
| [grafana_data_source.athena](https://registry.terraform.io/providers/grafana/grafana/3.17.0/docs/resources/data_source) | resource |
| [grafana_data_source.cloudwatch](https://registry.terraform.io/providers/grafana/grafana/3.17.0/docs/resources/data_source) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_amp_workspace_url"></a> [amp\_workspace\_url](#input\_amp\_workspace\_url) | value of the Amazon Managed Service for Prometheus workspace url | `string` | `""` | no |
| <a name="input_athena_database"></a> [athena\_database](#input\_athena\_database) | value of the Athena database to use | `string` | `""` | no |
| <a name="input_athena_datasource"></a> [athena\_datasource](#input\_athena\_datasource) | value of the Athena datasource | `string` | `""` | no |
| <a name="input_athena_workgroup"></a> [athena\_workgroup](#input\_athena\_workgroup) | value of the Athena workgroup to use | `string` | `""` | no |
| <a name="input_destination_bucket_arn"></a> [destination\_bucket\_arn](#input\_destination\_bucket\_arn) | value of the destination bucket arn | `string` | `""` | no |
| <a name="input_enable_xray"></a> [enable\_xray](#input\_enable\_xray) | control whether to enable xray related resources are created | `bool` | `false` | no |
| <a name="input_grafana_aws_account_id"></a> [grafana\_aws\_account\_id](#input\_grafana\_aws\_account\_id) | value of the grafana aws account id | `string` | `""` | no |
| <a name="input_grafana_aws_external_id"></a> [grafana\_aws\_external\_id](#input\_grafana\_aws\_external\_id) | value of the grafana aws external id | `string` | `""` | no |
| <a name="input_grafana_cloud_api_token"></a> [grafana\_cloud\_api\_token](#input\_grafana\_cloud\_api\_token) | value of the grafana cloud api token | `string` | `""` | no |
| <a name="input_grafana_data_source_name"></a> [grafana\_data\_source\_name](#input\_grafana\_data\_source\_name) | value of the grafana data source name | `string` | `"cloudwatch"` | no |
| <a name="input_log_bucket_name"></a> [log\_bucket\_name](#input\_log\_bucket\_name) | value of the log bucket name | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | value of the aws region | `string` | `"us-east-1"` | no |
| <a name="input_type"></a> [type](#input\_type) | Selects which type of data source to create. Valid values are cloudwatch, grafana-amazonprometheus-datasource, grafana-athena-datasource | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
