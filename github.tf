# Resources related to GitHub OIDC/Actions/anything necessary for Terraform/GitHub CI/CD


resource "aws_iam_openid_connect_provider" "github_oidc" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = ["6938fd4d98bab04faadb97b24396831d3780aea1"]
  url             = "https://token.actions.githubusercontent.com"
}


resource "aws_iam_role" "GitHubActionsTerraformRole" {
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRoleWithWebIdentity"
      Condition = {
        StringEquals = {
          "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
        }
        StringLike = {
          "token.actions.githubusercontent.com:sub" = "repo:x24sousa/CRC_TF_IaC:ref:refs/heads/main"
        }
      }
      Effect = "Allow"
      Principal = {
        Federated = aws_iam_openid_connect_provider.github_oidc.arn
      }
    }]
    Version = "2012-10-17"
  })
  description           = "For GitHub / Terraform CI/CD "
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "GitHubActionsTerraformRole"
  path                  = "/"
}


resource "aws_iam_role_policy" "github_actions_iam_read" {
  name = "GitHubActionsTerraformIAMRead"
  policy = jsonencode({
    Statement = [{
      Action = [
        "iam:GetRole",
        "iam:GetPolicy",
        "iam:GetPolicyVersion",
        "iam:GetRolePolicy",
        "iam:GetOpenIDConnectProvider",
        "iam:ListRolePolicies",
        "iam:ListAttachedRolePolicies",
        "iam:ListPolicyVersions"
      ]
      Effect   = "Allow"
      Resource = "*"
    }]
    Version = "2012-10-17"
  })
  role = aws_iam_role.GitHubActionsTerraformRole.name
}


resource "aws_iam_role_policy_attachment" "github_actions_poweruser" {
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
  role       = aws_iam_role.GitHubActionsTerraformRole.name
}
