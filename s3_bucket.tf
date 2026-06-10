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