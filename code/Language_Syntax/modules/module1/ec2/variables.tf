#without the default the variable becomes an input variable
variable "ec2name" {
  type = string
}

variable "ec2inst_type" {
  type    = string
  default = "t2.micro"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}
