
//provider "aws" {
//  region = "eu-west-1"
//}
//
//resource "aws_s3_bucket" "simple_bucket" {
//  acl    = "bucket-owner-full-control"
//
//  tags {
//    Name        = "dnvriend"
//    Environment = "dev"
//  }
//}

#TF_VAR_FOO="baz" terraform refresh
variable "FOO" {
  type = "string"
  default = "foo"
}

output "bar" {
  value = "${var.FOO}"
}