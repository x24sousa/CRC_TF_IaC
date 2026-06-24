### S3 bucket ##
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

# Bucket access policy
resource "aws_s3_bucket_policy" "resume_bucket_policy" {
  bucket = aws_s3_bucket.resume_bucket.id
  policy = jsonencode({
    Statement = [{
      Action    = "s3:GetObject"
      Effect    = "Allow"
      Principal = "*"
      Resource  = "${aws_s3_bucket.resume_bucket.arn}/*"
      Sid       = "PublicReadGetObject"
    }]
    Version = "2012-10-17"
  })
  region = var.region_west
}

# Public access policy for bucket, basically not useful right now
resource "aws_s3_bucket_public_access_block" "resume_bucket_public_access" {
  block_public_acls       = false
  block_public_policy     = false
  bucket                  = aws_s3_bucket.resume_bucket.id
  ignore_public_acls      = false
  region                  = var.region_west
  restrict_public_buckets = false
  skip_destroy            = null
}
