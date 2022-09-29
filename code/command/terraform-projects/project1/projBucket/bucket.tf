terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws"{
    region = "us-east-1"
}

resource "aws_s3_bucket" "myS3FirstBucket"{
    bucket = "S3FirstBucket"

    tags ={
        "Name" = "S3Bucket"
    }
}