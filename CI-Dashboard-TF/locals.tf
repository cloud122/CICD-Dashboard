locals {
  json_data = file("${path.module}/dummy-table-data")
  tf_data   = jsondecode(local.json_data)
}

#local.tf_data