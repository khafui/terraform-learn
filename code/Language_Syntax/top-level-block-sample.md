########
#Block 1: Terraform Settings Block
terraform {
    required_version = "~> 1.1.4" 1.2/3/4/5
    required_providers {
        aws = {
            source = "hasicorp/aws"
            version = "~> 3.0"
        }
    }


++++++++++++++++++++++++++++++++++
# Adding Backend as S3 for Remote State Storage with State Locking
    backend "s3" {
        bucket = "terraform-mylandmark"
        key = "prod/terraform.tfstate"
        region = "us-east-1"
        # For State Locking
        dynamodb_table = "terraform-lock"
    }

}

resource "aws_dynamodb_table" "~tf_lock"{
    name = "terraform-lock"
    hash_key = "LockID"
    read_capacity = 3
    write_capacity = 3
    attribute {
        name = "LockID"
        type = "S"
    }
    tags {
        Name = "Terraform Lock Table"
    }
}

#######
# Block 2: **Provider Block**
provider "aws" {
    profile = "default" # AWS Credentials Profile configured on your local desktop terminal $HOME/.aws/credentials
    region = "us-east-1"
}


#########
# Block 3: **Resource Block**
resource "aws_instance" "my_first_ec2" {
    ami = "ami-0c41531b8d18cc72b" #amazon linux
    instance_type = var.instance_type # reference from block 4 
}
<!-- 
arguements are what you can put into the resource example tags, address, associate_with_private_ip, customer_owned_ipv4_pool, instance, network_border_group, network_interface, public_ipv4_pool, vpc
attributes are what you can output from the resource example allocation_id, association_id, carrier_ip, customer_owned_ip, domain, id, private_dns, private_dns, private_ip, public_dns, public_ip, tags_all
 -->

#######
# Block 4 : **Input Variables Block**
variable "instance_type" {
    default = "t2.micro" 
    description = "EC2 Instance Type"
    type = string
}

#######
# Block 5: **Output Values Block**
output "ec2_instance_publicip" {
    description = "EC2 Instance Public IP"
    value = aws_instance.my_first_ec2.public_ip
}

##########
# Block 6 : **Local Values Block**
# Create S3 Bucket - with Input Variables & Local Values
locals {
    bucket-name-prefix = "${var.app_name}-${var.environment_name}"
}
<!-- 
these are declared locally 
to reference the local values block like 
bucket_name = locals.bucket-name-prefix 
 -->
########
# Block 7: **Data sources Block**
<!-- allows terraform to use data defined outside of terraform defined by another separate Terraform configuration, or modified by functions -->
# Get latest AMI ID for Amazon Linux os
data "aws-ami" "amzlinux" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-hvm-*"]
    }

    filter {
        name = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    filter {
        name = "architecture"
        values = ["x86_64"]
    }
}

#########
# Block 8: **Modules Block**