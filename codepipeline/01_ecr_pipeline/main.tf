
provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "src_bucket" {
  bucket = "dnvriend-source-bucket"
  acl    = "private"
}

resource "aws_iam_role" "codepipeline_role" {
  name = "cp-assume-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "codepipeline.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name = "codepipeline_policy"
  role = "${aws_iam_role.codepipeline_role.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect":"Allow",
      "Action": [
        "s3:*"
      ],
      "Resource": [
        "${aws_s3_bucket.src_bucket.arn}",
        "${aws_s3_bucket.src_bucket.arn}/*"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "codebuild:*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

data "aws_kms_alias" "s3kmskey" {
  name = "aws/s3"
}

resource "aws_codepipeline" "ecr_pipeline" {
  name     = "dnvriend_ecr_pipeline"
  role_arn = "${aws_iam_role.codepipeline_role.arn}"

  artifact_store {
    location = "${aws_s3_bucket.src_bucket.bucket}"
    type     = "S3"
    encryption_key {
      id   = "${data.aws_kms_alias.s3kmskey.arn}"
      type = "KMS"
    }
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "S3"
      version          = "1"

      configuration {
        S3Bucket      = "${aws_s3_bucket.src_bucket.bucket}"
        S3ObjectKey   = "DockerSample.zip"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name            = "Build"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["test"]
      version         = "1"

      configuration {
        ProjectName = "test"
      }
    }
  }
}
