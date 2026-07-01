terraform {
  backend "s3" {
    #S3 bucket info
    bucket       = "x24sousa.com-statefile"
    key          = "x24sousa.com/terraform.tfstate"
    region       = "us-west-2"
    use_lockfile = true
    encrypt      = true
  }
}