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
| <a name="requirement_grafana"></a> [grafana](#requirement\_grafana) | 2.19.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | 2.19.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_policy.cloudwatch_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy_attachment.aws_xray_read_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.cloudwatch_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.prometheus_query_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [aws_iam_user_policy_attachment.prometheus_remote_write_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy_attachment) | resource |
| [grafana_data_source.cloudwatch](https://registry.terraform.io/providers/grafana/grafana/2.19.4/docs/resources/data_source) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_amazon_prometheus"></a> [enable\_amazon\_prometheus](#input\_enable\_amazon\_prometheus) | control whether to enable amazon prometheus related resources are created | `bool` | `false` | no |
| <a name="input_enable_cloudwatch"></a> [enable\_cloudwatch](#input\_enable\_cloudwatch) | control whether to enable cloudwatch related resources are created | `bool` | `false` | no |
| <a name="input_enable_xray"></a> [enable\_xray](#input\_enable\_xray) | control whether to enable xray related resources are created | `bool` | `false` | no |
| <a name="input_grafana_api_token"></a> [grafana\_api\_token](#input\_grafana\_api\_token) | value of the grafana api token | `string` | `""` | no |
| <a name="input_grafana_data_source_name"></a> [grafana\_data\_source\_name](#input\_grafana\_data\_source\_name) | value of the grafana data source name | `string` | `"cloudwatch"` | no |
| <a name="input_region"></a> [region](#input\_region) | value of the aws region | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudwatch_data_source_id"></a> [cloudwatch\_data\_source\_id](#output\_cloudwatch\_data\_source\_id) | n/a |
| <a name="output_cloudwatch_data_source_name"></a> [cloudwatch\_data\_source\_name](#output\_cloudwatch\_data\_source\_name) | n/a |
<!-- END_TF_DOCS -->
