
provider "aws" {
  region = "eu-west-1"
}

# Provides an IAM user
resource "aws_iam_user" "dnvriend-git" {
  name = "dnvriend-git"
  path = "/user/"
}

# Provides an IAM access key.
# This is a set of credentials that
# allow API requests to be made as an IAM user
resource "aws_iam_access_key" "dnvriend-git" {
  user = "${aws_iam_user.dnvriend-git.name}"
}

# Attaches a Managed IAM Policy to an IAM user
resource "aws_iam_user_policy_attachment" "dnvriend-attachment" {
    user       = "${aws_iam_user.dnvriend-git.name}"
    policy_arn = "arn:aws:iam::aws:policy/AWSCodeCommitFullAccess"
}

output "secret" {
  value = "${aws_iam_access_key.dnvriend-git.encrypted_secret}"
}