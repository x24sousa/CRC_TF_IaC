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
  to = aws_iam_role_policy_attachment.codebuild_base_attachment
  id = "codebuild-X24sousa_CICD-service-role/arn:aws:iam::538661800229:policy/service-role/CodeBuildBasePolicy-X24sousa_CICD-us-west-2"
}

import {
  to = aws_iam_role_policy_attachment.codebuild_credentials_attachment
  id = "codebuild-X24sousa_CICD-service-role/arn:aws:iam::538661800229:policy/service-role/CodeBuildCodeConnectionsSourceCredentialsPolicy-X24sousa_CICD-us-west-2-538661800229"
}






/*
import {
  to = aws_dynamodb_table.x24_dynamo
  id = "VisitorCountTable"
}

*/
