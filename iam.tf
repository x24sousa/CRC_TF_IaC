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


resource "aws_lambda_permission" "visitorcount_permission" {
  action        = "lambda:InvokeFunction"
  function_name = "VisitorCountFuntion"
  principal     = "apigateway.amazonaws.com"
  region        = "us-west-2"
  source_arn    = "${aws_apigatewayv2_api.visitor_api.execution_arn}/*/*/VisitorCountFuntion"
  statement_id  = "lambda-5d1c5bd4-9255-4540-b0aa-c6eea8a3eb31"
}


# Policy attachments. These link the roles to the policies themselves
resource "aws_iam_role_policy_attachment" "dynamo_attachment" {
  policy_arn = aws_iam_policy.visitorcount_policy.arn
  role       = "VisitorCountFuntion-role-zch8ls5j"
}

# Policy attachments. These link the roles to the policies themselves
resource "aws_iam_role_policy_attachment" "lambda_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  role       = "VisitorCountFuntion-role-zch8ls5j"
}
