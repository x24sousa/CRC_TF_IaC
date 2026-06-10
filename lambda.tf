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
  region                         = "us-west-2"
  reserved_concurrent_executions = -1
  role                           = "arn:aws:iam::538661800229:role/VisitorCountFuntion-role-zch8ls5j"
  runtime                        = "python3.12"
  skip_destroy                   = false
  #tags                               = {}
  #tags_all                           = {}
  timeout = 3
  ephemeral_storage {
    size = 512
  }
  logging_config {
    #application_log_level = null
    log_format = "Text"
    log_group  = "/aws/lambda/VisitorCountFuntion"
    #system_log_level      = null
  }
  tracing_config {
    mode = "PassThrough"
  }
}
