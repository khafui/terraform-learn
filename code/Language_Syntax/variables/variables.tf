variable "region" {
    description = "The aws region"
    type = string
    default = "us-east-1"
}

/* variable "my_ami" {
    description = "The aws ami"
    type = string
    default = "ami-0c41531b8d18cc72b"
} */

variable "instance_type" {
    description = "The ec2 instance type"
    type = string
    default = "t2.medium"
}


variable "key_pair" {
    description = "The ec2 key pair"
    type = string
    default = "Automationkey"
}