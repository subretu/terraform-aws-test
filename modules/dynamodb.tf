resource "aws_dynamodb_table" "members" {
  name           = "dynamodb-sample-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 1
  write_capacity = 1

  hash_key = "mail"

  attribute {
    name = "mail"
    type = "S"
  }

  tags = {
    Name = "members"
  }
}

locals {
  json_data = file("../../json/members.json")
  members   = jsondecode(local.json_data)
}

resource "aws_dynamodb_table_item" "members" {
  for_each = local.members

  table_name = aws_dynamodb_table.members.name
  hash_key   = aws_dynamodb_table.members.hash_key

  item = jsonencode({
    mail   = each.key
    name   = each.value["name"]
    github = contains(keys(each.value), "github") ? each.value["github"]["S"] : "default"
  })
}
