
provider "aws" {
  region = "eu-west-1"
}

resource "aws_ecr_repository" "my_repo" {
  name = "my_repo"
}