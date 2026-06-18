#CodeBuild Project

resource "aws_codebuild_project" "x24sousa_cicd" {
  auto_retry_limit   = 0
  build_timeout      = 60
  encryption_key     = "arn:aws:kms:us-west-2:538661800229:alias/aws/s3"
  name               = "X24sousa_CICD"
  project_visibility = "PRIVATE"
  queued_timeout     = 480
  region             = "us-west-2"
  service_role       = "arn:aws:iam::538661800229:role/service-role/codebuild-X24sousa_CICD-service-role"
  artifacts {
    type = "NO_ARTIFACTS"
  }
  cache {
    type = "NO_CACHE"
  }
  environment {
    compute_type                = "BUILD_GENERAL1_MEDIUM"
    image                       = "aws/codebuild/amazonlinux-x86_64-standard:6.0"
    image_pull_credentials_type = "CODEBUILD"
    type                        = "LINUX_CONTAINER"
  }
  logs_config {
    cloudwatch_logs {
      status = "ENABLED"
    }
    s3_logs {
      status = "DISABLED"
    }
  }
  source {
    buildspec       = "buildspec.yaml"
    git_clone_depth = 1
    location        = "https://github.com/x24sousa/CloudResumeChallenge"
    type            = "GITHUB"
    git_submodules_config {
      fetch_submodules = false
    }
  }
}
