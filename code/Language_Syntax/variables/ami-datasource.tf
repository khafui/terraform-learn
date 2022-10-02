# Data Sources 
/* get latest ami id for linux2 os */
/* to query data we use the data block accompanied with resourse type */


data "aws_ami" "amazonlinux2" {
  # executable_users = ["self"]
  most_recent      = true

  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

