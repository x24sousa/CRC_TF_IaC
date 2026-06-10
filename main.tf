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












/*
import {
  to = aws_route53_record.CNAME
  id = "Z05720531MSHK0AAJ0Q96__99cdba28aefb0537fb0b076af0f47efe.x24sousa.com_CNAME"
}

*/
