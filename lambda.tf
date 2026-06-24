### Lambda - VisitorCountFuntion ###

resource "aws_lambda_function" "visitor_function" {
  architectures                  = ["x86_64"]
  code_sha256                    = "p3UHSnfS6oh13MJUPkwwCRqkWrdkaVdJADrhmrXGccs="
  filename                       = "VisitorCountFuntion.zip"
  function_name                  = "VisitorCountFuntion"
  handler                        = "lambda_function.lambda_handler"
  layers                         = []
  memory_size                    = 128
  package_type                   = "Zip"
  region                         = var.region_west
  reserved_concurrent_executions = -1
  role                           = aws_iam_role.visitorcount_role.arn
  runtime                        = "python3.12"
  skip_destroy                   = false
  timeout                        = 3
  ephemeral_storage {
    size = 512
  }
  logging_config {
    log_format = "Text"
    log_group  = aws_cloudwatch_log_group.visitorcountfuntion_log.name
  }
  tracing_config {
    mode = "PassThrough"
  }
}

#------------------------------------------------------------------------------------------------

### AWS Log Group resource ###

resource "aws_cloudwatch_log_group" "visitorcountfuntion_log" {
  log_group_class   = "STANDARD"
  name              = "/aws/lambda/VisitorCountFuntion"
  region            = var.region_west
  retention_in_days = 0
}
