terraform {
    required_version = "~> 1.0"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
   # project = "acme-app" # this is optional
    region = "us-east-1"
    #profile = "default"
}

resource "aws_instance" "my_first_terraform_ec2" {
    ami = "ami-0c41531b8d18cc72b" #us-east-1
    instance_type = "t2.micro"
    
    tags = {
        "Name" = "my_first_ec2"
    }
}

variable "instance_type"{
     default = "t2.micro" 
    description = "EC2 Instance Type"
    type = "string"
}


/* 
resource  "aws_instance" "myec2"{
    ami = "csc"
    instance_type ="t2.medium"
    key_name = "Automationkey"
}

 resource "aws_s3_bucket" "Name" {
    bucket = "Name"
    tags {
      Name = "Name"
    }
 }
  */