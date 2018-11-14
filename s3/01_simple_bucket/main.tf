
provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "simple_bucket" {
  acl    = "bucket-owner-full-control"

  tags {
    Name        = "dnvriend"
    Environment = "dev"
  }
}