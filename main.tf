### Default AWS provider ###
provider "aws" {
  region = "us-west-2"
}

### Aliased AWS provider ###
provider "aws" {
  region = "us-east-1"
  alias  = "aws_east"

}


import {
  to = aws_s3_bucket_policy.resume_bucket_policy
  id = "x24sousa.com"
}

import {
  to = aws_s3_bucket_public_access_block.resume_bucket_public_access
  id = "x24sousa.com"
}


/*
import {
  to = aws_dynamodb_table.x24_dynamo
  id = "VisitorCountTable"
}

*/
