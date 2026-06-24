### Default AWS provider ###
provider "aws" {
  region = var.region_west
}

### Aliased AWS provider ###
provider "aws" {
  region = var.region_east
  alias  = "aws_east"

}


/*

import {
  to = aws_codestarconnections_connection.codebuild_codestarconnection
  id = "arn:aws:codestar-connections:us-west-2:538661800229:connection/d63be2a7-6a4e-4bdc-b93a-d82a270408b4"
}




*/
/*
import {
  to = aws_dynamodb_table.x24_dynamo
  id = "VisitorCountTable"
}

*/
