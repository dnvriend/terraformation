
provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "log_bucket" {
  acl    = "log-delivery-write"

  tags {
    Name        = "dnvriend"
    Environment = "dev"
  }
}

resource "aws_s3_bucket" "simple_bucket" {
  acl    = "bucket-owner-full-control"

  tags {
    Name        = "dnvriend"
    Environment = "dev"
  }

  logging {
    target_bucket = "${aws_s3_bucket.log_bucket.id}"
    target_prefix = "log/"
  }
}