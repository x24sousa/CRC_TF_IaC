#CodeBuild Project

resource "aws_codebuild_project" "x24sousa_cicd" {
  auto_retry_limit   = 0
  build_timeout      = 60
  encryption_key     = "arn:aws:kms:us-west-2:538661800229:alias/aws/s3"
  name               = "X24sousa_CICD"
  project_visibility = "PRIVATE"
  queued_timeout     = 480
  region             = "us-west-2"
  service_role       = aws_iam_role.cicd_service_role.arn
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



### IAM Role ###

resource "aws_iam_role" "cicd_service_role" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "codebuild.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "codebuild-X24sousa_CICD-service-role"
  path                  = "/service-role/"
}



### Role policy for the above role  ###

resource "aws_iam_role_policy" "codebuild_modify_s3" {
  name = "CodeBuildModifyS3X24Sousa"
  policy = jsonencode({
    Statement = [{
      Action   = "s3:ListBucket"
      Effect   = "Allow"
      Resource = aws_s3_bucket.resume_bucket.arn
      Sid      = "ListResumeBucket"
      }, {
      Action   = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
      Effect   = "Allow"
      Resource = "${aws_s3_bucket.resume_bucket.arn}/*"
      Sid      = "ModifyResumeBucketObjects"
      }, {
      Action   = "cloudfront:CreateInvalidation"
      Effect   = "Allow"
      Resource = "*"
      Sid      = "InvalidateCloudFront"
    }]
    Version = "2012-10-17"
  })
  role = aws_iam_role.cicd_service_role.name
}

###   ###

resource "aws_iam_policy" "codebuild_base_policy" {
  description = "Policy used in trust relationship with CodeBuild"
  name        = "CodeBuildBasePolicy-X24sousa_CICD-us-west-2"
  path        = "/service-role/"
  policy = jsonencode({
    Statement = [{
      Action   = ["logs:CreateLogGroup", "logs:CreateLogStream", "logs:PutLogEvents"]
      Effect   = "Allow"
      Resource = ["arn:aws:logs:us-west-2:538661800229:log-group:/aws/codebuild/X24sousa_CICD", "arn:aws:logs:us-west-2:538661800229:log-group:/aws/codebuild/X24sousa_CICD:*"]
      }, {
      Action   = ["s3:PutObject", "s3:GetObject", "s3:GetObjectVersion", "s3:GetBucketAcl", "s3:GetBucketLocation"]
      Effect   = "Allow"
      Resource = ["arn:aws:s3:::codepipeline-us-west-2-*"]
      }, {
      Action   = ["codebuild:CreateReportGroup", "codebuild:CreateReport", "codebuild:UpdateReport", "codebuild:BatchPutTestCases", "codebuild:BatchPutCodeCoverages"]
      Effect   = "Allow"
      Resource = ["arn:aws:codebuild:us-west-2:538661800229:report-group/X24sousa_CICD-*"]
    }]
    Version = "2012-10-17"
  })
}

###   ###

resource "aws_iam_policy" "codebuild_connections_credentials" {
  description = "Policy used in trust relationship with CodeBuild"
  name        = "CodeBuildCodeConnectionsSourceCredentialsPolicy-X24sousa_CICD-us-west-2-538661800229"
  path        = "/service-role/"
  policy = jsonencode({
    Statement = [{
      Action   = ["codestar-connections:GetConnectionToken", "codestar-connections:GetConnection", "codeconnections:GetConnectionToken", "codeconnections:GetConnection", "codeconnections:UseConnection"]
      Effect   = "Allow"
      Resource = ["arn:aws:codestar-connections:us-west-2:538661800229:connection/8a8f93be-4e0f-49d2-9e3f-2bfe634357e5", "arn:aws:codeconnections:us-west-2:538661800229:connection/8a8f93be-4e0f-49d2-9e3f-2bfe634357e5"]
    }]
    Version = "2012-10-17"
  })
}
