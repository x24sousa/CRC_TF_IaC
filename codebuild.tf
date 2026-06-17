#CodeBuild Project

resource "aws_codebuild_project" "x24sousa_cicd" {
  auto_retry_limit = 0
  badge_enabled    = false
  build_timeout    = 60
  #concurrent_build_limit = 0
  encryption_key       = "arn:aws:kms:us-west-2:538661800229:alias/aws/s3"
  name                 = "X24sousa_CICD"
  project_visibility   = "PRIVATE"
  queued_timeout       = 480
  region               = "us-west-2"
  resource_access_role = null
  service_role         = "arn:aws:iam::538661800229:role/service-role/codebuild-X24sousa_CICD-service-role"
  source_version       = null
  tags                 = {}
  tags_all             = {}
  artifacts {
    type = "NO_ARTIFACTS"
  }
  cache {
    cache_namespace = null
    location        = null
    modes           = []
    type            = "NO_CACHE"
  }
  environment {
    certificate                 = null
    compute_type                = "BUILD_GENERAL1_MEDIUM"
    image                       = "aws/codebuild/amazonlinux-x86_64-standard:6.0"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = false
    type                        = "LINUX_CONTAINER"
  }
  logs_config {
    cloudwatch_logs {
      group_name  = null
      status      = "ENABLED"
      stream_name = null
    }
    s3_logs {
      bucket_owner_access = null
      encryption_disabled = false
      location            = null
      status              = "DISABLED"
    }
  }
  source {
    buildspec           = "buildspec.yaml"
    git_clone_depth     = 1
    insecure_ssl        = false
    location            = "https://github.com/x24sousa/CloudResumeChallenge"
    report_build_status = false
    type                = "GITHUB"
    git_submodules_config {
      fetch_submodules = false
    }
  }
}
