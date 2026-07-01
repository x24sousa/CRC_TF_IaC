### API ###

resource "aws_apigatewayv2_api" "visitor_api" {
  api_key_selection_expression = "$request.header.x-api-key"
  description                  = "Created by AWS Lambda"
  disable_execute_api_endpoint = false
  ip_address_type              = "ipv4"
  name                         = "VisitorCountFuntion-API"
  protocol_type                = "HTTP"
  region                       = var.region_west
  route_selection_expression   = "$request.method $request.path"
  cors_configuration {
    allow_credentials = false
    allow_origins     = ["*"]
    max_age           = 0
  }
}


### API Stage ###

resource "aws_apigatewayv2_stage" "api_stage" {
  api_id      = aws_apigatewayv2_api.visitor_api.id
  auto_deploy = true
  description = "Created by AWS Lambda"
  name        = "default"
  region      = var.region_west
  default_route_settings {
    data_trace_enabled       = false
    detailed_metrics_enabled = false
    throttling_burst_limit   = 0
    throttling_rate_limit    = 0
  }
}


### API Route ###

resource "aws_apigatewayv2_route" "api_route" {
  api_id             = aws_apigatewayv2_api.visitor_api.id
  api_key_required   = false
  authorization_type = "NONE"
  region             = var.region_west
  route_key          = "GET /VisitorCountFuntion"
  target             = "integrations/${aws_apigatewayv2_integration.api_integration.id}"
}


### API Integration ###

resource "aws_apigatewayv2_integration" "api_integration" {
  api_id                 = aws_apigatewayv2_api.visitor_api.id
  connection_type        = "INTERNET"
  integration_method     = "POST"
  integration_type       = "AWS_PROXY"
  integration_uri        = aws_lambda_function.visitor_function.arn
  payload_format_version = "2.0"
  region                 = var.region_west
  timeout_milliseconds   = 30000
}
