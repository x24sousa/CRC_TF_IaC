### IAM roles ###

resource "aws_iam_role" "visitorcount_role" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "VisitorCountFuntion-role-zch8ls5j"
  path                  = "/"
}


### IAM policy ###

resource "aws_iam_policy" "visitorcount_policy" {
  name = "VisitorCountFuntion-role-zch8ls5jPolicy"
  path = "/"
  policy = jsonencode({
    Statement = [{
      Action   = ["dynamodb:UpdateItem", "dynamodb:Scan"]
      Effect   = "Allow"
      Resource = aws_dynamodb_table.x24_dynamo.arn
      Sid      = "UpdateDynamoDB"
    }]
    Version = "2012-10-17"
  })
}
