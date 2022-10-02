terraform {
  required_version = "~>1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}


/* provider block */

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

provider "aws" {
  region = var.aws_region
}


module "ec2module" {
    source ="./ec2"
    ec2name ="Demo-ec2"
}

output "module_output" {
    value = module.ec2module.instance_id
}

