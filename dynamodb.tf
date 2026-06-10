### DynamoDB Table ###

resource "aws_dynamodb_table" "x24_dynamo" {
  billing_mode                = "PAY_PER_REQUEST"
  deletion_protection_enabled = true
  hash_key                    = "visitor_count_id"
  name                        = "VisitorCountTable"
  read_capacity               = 0
  region                      = "us-west-2"
  stream_enabled              = false
  table_class                 = "STANDARD"
  write_capacity              = 0
  attribute {
    name = "visitor_count_id"
    type = "N"
  }
  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }
}
