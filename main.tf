provider "aws" {
  region = "us-west-2"
}

# S3 bucket
resource "aws_s3_bucket" "resume_bucket" {
  bucket = "x24sousa.com"

  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }
}

#S3 bucket versioning resource
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.resume_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

#Cloudfront Distro
resource "aws_cloudfront_distribution" "cloudfront_distro" {
  aliases         = ["www.x24sousa.com", "x24sousa.com"]
  enabled         = true
  http_version    = "http2"
  is_ipv6_enabled = true
  price_class     = "PriceClass_All"
  tags = {
    Name = "My Resume"
  }
  tags_all = {
    Name = "My Resume"
  }
  wait_for_deployment = true
  web_acl_id          = "arn:aws:wafv2:us-east-1:538661800229:global/webacl/CreatedByCloudFront-04fdc8cf/8d70a546-9949-4306-b0a9-185421832f1d"
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    cached_methods         = ["GET", "HEAD"]
    compress               = true
    default_ttl            = 0
    max_ttl                = 0
    min_ttl                = 0
    target_origin_id       = "x24sousa.com.s3.us-west-2.amazonaws.com-mplf868vsc6"
    viewer_protocol_policy = "redirect-to-https"
    grpc_config {
      enabled = false
    }
  }
  origin {
    connection_attempts         = 3
    connection_timeout          = 10
    domain_name                 = "x24sousa.com.s3-website-us-west-2.amazonaws.com"
    origin_id                   = "x24sousa.com.s3.us-west-2.amazonaws.com-mplf868vsc6"
    response_completion_timeout = 0
    custom_origin_config {
      http_port                = 80
      https_port               = 443
      ip_address_type          = "ipv4"
      origin_keepalive_timeout = 5
      origin_protocol_policy   = "http-only"
      origin_read_timeout      = 30
      origin_ssl_protocols     = ["SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"]
    }
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn      = "arn:aws:acm:us-east-1:538661800229:certificate/e1a6996f-85a2-4711-87f9-8d9de1a98d44"
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"
  }
}

#Route 53 Zone
resource "aws_route53_zone" "route53_x24sousa" {
  comment                     = "HostedZone created by Route53 Registrar"
  enable_accelerated_recovery = false
  name                        = "x24sousa.com"
}








/*
import {
  to = aws_route53_record.CNAME
  id = "Z05720531MSHK0AAJ0Q96__99cdba28aefb0537fb0b076af0f47efe.x24sousa.com_CNAME"
}

*/
