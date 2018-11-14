
provider "aws" {
  region = "eu-west-1"
}

resource "aws_codecommit_repository" "test" {
  repository_name = "my_test_repository"
  description     = "This is the Sample App Repository"
}

resource "aws_codecommit_trigger" "test" {
  repository_name = "${aws_codecommit_repository.test.repository_name}"

  trigger {
    name            = "noname"
    events          = ["all"]
    destination_arn = "${aws_sns_topic.test.arn}"
  }
}

resource "aws_sns_topic" "test" {
  name = "user-updates-topic"
}