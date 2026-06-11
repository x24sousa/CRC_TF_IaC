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


### API Stage ###

resource "aws_apigatewayv2_stage" "api_stage" {
  api_id                = "jmic5vdez6"
  auto_deploy           = true
  deployment_id         = "r4fe16"
  description           = "Created by AWS Lambda"
  name                  = "default"
  region                = "us-west-2"
  default_route_settings {
    data_trace_enabled       = false
    detailed_metrics_enabled = false
    throttling_burst_limit   = 0
    throttling_rate_limit    = 0
  }
}


### API Route ###

resource "aws_apigatewayv2_route" "api_route" {
  api_id                              = "jmic5vdez6"
  api_key_required                    = false
  authorization_type                  = "NONE"
  region                              = "us-west-2"
  route_key                           = "GET /VisitorCountFuntion"
  target                              = "integrations/h024gfb"
}


### API Integration ###

resource "aws_apigatewayv2_integration" "api_integration" {
  api_id                        = "jmic5vdez6"
  connection_type               = "INTERNET"
  integration_method            = "POST"
  integration_type              = "AWS_PROXY"
  integration_uri               = "arn:aws:lambda:us-west-2:538661800229:function:VisitorCountFuntion"
  payload_format_version        = "2.0"
  region                        = "us-west-2"
  template_selection_expression = null
  timeout_milliseconds          = 30000
}
