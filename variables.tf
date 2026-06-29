variable "region_west" {
  description = "Primary AWS region for CRC resources"
  type        = string
  default     = "us-west-2"
}

variable "region_east" {
  description = "AWS region required for CloudFront ACM/WAF resources"
  type        = string
  default     = "us-east-1"
}

variable "domain_x24" {
  description = "Domain name for the resume site"
  type        = string
  default     = "x24sousa.com"
}

