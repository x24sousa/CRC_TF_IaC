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
  to = aws_iam_role_policy_attachment.lambda_attachment
  id = "VisitorCountFuntion-role-zch8ls5j/arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}


import {
  to = aws_iam_role_policy_attachment.dynamo_attachment
  id = "VisitorCountFuntion-role-zch8ls5j/arn:aws:iam::538661800229:policy/VisitorCountFuntion-role-zch8ls5jPolicy"
}



/*
import {
  to = aws_dynamodb_table.x24_dynamo
  id = "VisitorCountTable"
}

*/
