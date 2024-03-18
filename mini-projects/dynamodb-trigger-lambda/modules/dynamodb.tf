resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name         = "cat-adoption"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "CatId"

  attribute {
    name = "CatId"
    type = "S"
  }

  attribute {
    name = "Adopted"
    type = "S"
  }

  global_secondary_index {
    name     = "Adopted-Index"
    hash_key = "Adopted"
    # write_capacity     = 10
    # read_capacity      = 10
    projection_type = "ALL"
    # non_key_attributes = ["UserId"]
  }

  tags = {
    Name        = "dynamodb-table-cat"
    Environment = "production"
  }
}

resource "aws_dynamodb_table_item" "cat_1" {
  table_name = aws_dynamodb_table.basic-dynamodb-table.name
  hash_key   = aws_dynamodb_table.basic-dynamodb-table.hash_key

  item = <<ITEM
{
  "CatId": {"S": "cat0001"},
  "catName": {"S": "merlin"},
  "adopted": {"S": "false"}
}
ITEM
}

resource "aws_dynamodb_table_item" "cat_2" {
  table_name = aws_dynamodb_table.basic-dynamodb-table.name
  hash_key   = aws_dynamodb_table.basic-dynamodb-table.hash_key

  item = <<ITEM
{
  "CatId": {"S": "cat0002"},
  "catName": {"S": "notmerlin"},
  "adopted": {"S": "false"}
}
ITEM
}

resource "aws_dynamodb_table_item" "cat_3" {
  table_name = aws_dynamodb_table.basic-dynamodb-table.name
  hash_key   = aws_dynamodb_table.basic-dynamodb-table.hash_key

  item = <<ITEM
{
  "CatId": {"S": "cat0003"},
  "catName": {"S": "reallynotmerlin"},
  "adopted": {"S": "false"}
}
ITEM
}
