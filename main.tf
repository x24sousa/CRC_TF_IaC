### Default AWS provider ###
provider "aws" {
  region = var.region_west
}

### Aliased AWS provider ###
provider "aws" {
  region = var.region_east
  alias  = "aws_east"

}



import {
  to = aws_iam_role_policy_attachment.github_actions_poweruser
  id = "${aws_iam_role.GitHubActionsTerraformRole.name}/arn:aws:iam::aws:policy/PowerUserAccess"
}