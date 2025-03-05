locals {
  account_id = data.aws_caller_identity.current.account_id
}

data "aws_caller_identity" "current" {}

resource "aws_glue_catalog_database" "access_logs" {
  name = var.glue_database_name
}

resource "aws_athena_workgroup" "this" {
  name = "${var.log_bucket_name}-workgroup"

  configuration {
    enforce_workgroup_configuration    = true
    publish_cloudwatch_metrics_enabled = true
    result_configuration {
      output_location = "s3://${aws_s3_bucket.destination_bucket.bucket}/"
    }
  }
}



resource "aws_glue_catalog_table" "access_logs" {
  name          = var.glue_table_name
  database_name = aws_glue_catalog_database.access_logs.name
  table_type    = "EXTERNAL_TABLE"

  parameters = {
    "classification" = "log"
  }

  storage_descriptor {
    location      = "s3://${var.log_bucket_name}/logs/AWSLogs/${local.account_id}/elasticloadbalancing/${var.region}/${var.current_year}/"
    input_format  = "org.apache.hadoop.mapred.TextInputFormat"
    output_format = "org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat"

    ser_de_info {
      name                  = "RegexSerDe"
      serialization_library = "org.apache.hadoop.hive.serde2.RegexSerDe"
      parameters = {
        "serialization.format" = 1
        "input.regex"          = "([^ ]*) ([^ ]*) ([^ ]*) ([^ ]*):([0-9]*) ([^ ]*)[:-]([0-9]*) ([-.0-9]*) ([-.0-9]*) ([-.0-9]*) (|[-0-9]*) (-|[-0-9]*) ([-0-9]*) ([-0-9]*) \\\"([^ ]*) ([^ ]*) (- |[^ ]*)\\\" \\\"([^\\\"]*)\\\" ([A-Z0-9-]+) ([A-Za-z0-9.-]*) ([^ ]*) \\\"([^\\\"]*)\\\" \\\"([^\\\"]*)\\\" \\\"([^\\\"]*)\\\" ([-.0-9]*) ([^ ]*) \\\"([^\\\"]*)\\\" \\\"([^\\\"]*)\\\"($| \\\"[^ ]*\\\")(.*)"
      }
    }
    columns {
      name = "type"
      type = "string"
    }
    columns {
      name = "time"
      type = "string"
    }
    columns {
      name = "elb"
      type = "string"
    }
    columns {
      name = "client_ip"
      type = "string"
    }
    columns {
      name = "client_port"
      type = "int"
    }
    columns {
      name = "target_ip"
      type = "string"
    }
    columns {
      name = "target_port"
      type = "int"
    }
    columns {
      name = "request_processing_time"
      type = "double"
    }
    columns {
      name = "target_processing_time"
      type = "double"
    }
    columns {
      name = "response_processing_time"
      type = "double"
    }
    columns {
      name = "elb_status_code"
      type = "int"
    }
    columns {
      name = "target_status_code"
      type = "int"
    }
    columns {
      name = "received_bytes"
      type = "bigint"
    }
    columns {
      name = "sent_bytes"
      type = "bigint"
    }
    columns {
      name = "request_verb"
      type = "string"
    }
    columns {
      name = "request_url"
      type = "string"
    }
    columns {
      name = "request_proto"
      type = "string"
    }
    columns {
      name = "user_agent"
      type = "string"
    }
    columns {
      name = "ssl_cipher"
      type = "string"
    }
    columns {
      name = "ssl_protocol"
      type = "string"
    }
    columns {
      name = "target_group_arn"
      type = "string"
    }
    columns {
      name = "trace_id"
      type = "string"
    }
    columns {
      name = "domain_name"
      type = "string"
    }
    columns {
      name = "chosen_cert_arn"
      type = "string"
    }
    columns {
      name = "matched_rule_priority"
      type = "string"
    }
    columns {
      name = "request_creation_time"
      type = "string"
    }
    columns {
      name = "actions_executed"
      type = "string"
    }
    columns {
      name = "redirect_url"
      type = "string"
    }
    columns {
      name = "lambda_error_reason"
      type = "string"
    }
    columns {
      name = "target_port_list"
      type = "string"
    }
    columns {
      name = "target_status_code_list"
      type = "string"
    }
    columns {
      name = "classification"
      type = "string"
    }
    columns {
      name = "classification_reason"
      type = "string"
    }
  }
}

module "this" {
  source                   = "../../modules/aws_grafana_datasource"
  type                     = "grafana-athena-datasource"
  region                   = var.region
  grafana_data_source_name = "${var.log_bucket_name}-athena"
  grafana_cloud_api_token  = var.grafana_cloud_api_token
  destination_bucket_arn   = aws_s3_bucket.destination_bucket.arn
  grafana_aws_account_id   = var.grafana_aws_account_id
  grafana_aws_external_id  = var.grafana_aws_external_id
  athena_workgroup         = aws_athena_workgroup.this.name
  athena_database          = aws_glue_catalog_database.access_logs.name
  # athena_output_location   = "s3://${aws_s3_bucket.destination_bucket.bucket}/"
  athena_datasource = "AWSDataCatalog"
  log_bucket_name   = var.log_bucket_name
}
