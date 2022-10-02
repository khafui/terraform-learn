terraform {
    required_version = "~>1.0"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>3.0"
        }
    }
}

variable "aws_region"{
    type = string
    default = "us-east-1"
}

provider "aws" {
    region = var.aws_region
}

module "db" {
    source = "./db"
}

module "web" {
    source = "./web"
}

output "PrivateIP" {
    value = module.db.PrivateIP
}

output "PublicIP" {
    value = module.web.pub_ip
}