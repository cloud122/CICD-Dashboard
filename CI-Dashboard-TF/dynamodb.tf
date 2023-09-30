resource "aws_dynamodb_table_item" "config_json-remote" {
  table_name = aws_dynamodb_table.dynamodb_table_remote[0].name
  hash_key   = aws_dynamodb_table.dynamodb_table_remote[0].hash_key
  #for_each   = local.tf_data
  for_each = var.create_CICD_Dashboard ? local.tf_data : {}
  item       = jsonencode(each.value)
  #for host in local.user_data.hosts : host
}
resource "aws_dynamodb_table" "dynamodb_table_remote" {
  count = var.create_CICD_Dashboard ? 1 : 0
  name           = "vl-${var.ENVIRONMENT}-repo-names"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "repo_name"

  attribute {
    name = "repo_name"
    type = "S"
  }

  # ttl {
  #   attribute_name = "TimeToExist"
  #   enabled        = false
  # }

}

