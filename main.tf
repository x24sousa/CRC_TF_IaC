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
  to = aws_codestarconnections_connection.codebuild_codestarconnection
  id = "arn:aws:codestar-connections:us-west-2:538661800229:connection/8a8f93be-4e0f-49d2-9e3f-2bfe634357e5"
}

*/
/*
import {
  to = aws_dynamodb_table.x24_dynamo
  id = "VisitorCountTable"
}

*/
