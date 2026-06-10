### API ###

resource "aws_apigatewayv2_api" "visitor_api" {
  api_key_selection_expression = "$request.header.x-api-key"
  description                  = "Created by AWS Lambda"
  disable_execute_api_endpoint = false
  ip_address_type              = "ipv4"
  name                         = "VisitorCountFuntion-API"
  protocol_type                = "HTTP"
  region                       = "us-west-2"
  route_selection_expression   = "$request.method $request.path"
  cors_configuration {
    allow_credentials = false
    allow_origins     = ["*"]
    max_age           = 0
  }
}
