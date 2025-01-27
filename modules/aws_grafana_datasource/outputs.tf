# output "cloudwatch_data_source_name" {
#   value = length(try(grafana_data_source.cloudwatch, [])) > 0 ? grafana_data_source.cloudwatch[0].name : ""
# }

# output "cloudwatch_data_source_id" {
#   value = length(try(grafana_data_source.cloudwatch, [])) > 0 ? grafana_data_source.cloudwatch[0].id : ""
# }
