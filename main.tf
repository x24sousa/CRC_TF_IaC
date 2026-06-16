### Default AWS provider ###
provider "aws" {
  region = "us-west-2"
}

### Aliased AWS provider ###
provider "aws" {
  region = "us-east-1"
  alias  = "aws_east"

}












/*
import {
  to = aws_dynamodb_table.x24_dynamo
  id = "VisitorCountTable"
}

*/
