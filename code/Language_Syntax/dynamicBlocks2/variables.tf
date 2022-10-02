variable "ingressrules" {
  type    = list(number)
  default = [80, 443, 8080, 22]
}
variable "egressrules" {
  type    = list(number)
  default = [80, 443, 25, 3306, 53, 8080]
}


variable "my_instance_type" {
  type = string
  default = "t3.micro"
}

variable "aws_region"{
  type = string
  default = "us-east-1"
}

/* AWS ec2 instance key pair */
variable "instance_keypair" {
  description = "AWS EC2 key pair that need to be associated with EC2 instance"
  type = string
  default = "Automationkey"
}

/* AWS EC2 Instance Type List */
variable "instance_type_list" {
  description = "EC2 Instance Type"
  type = list(string)
  default = ["t2.micro", "t2.medium", "t3.large"]
}

/* EC2 Instance Type Map */
variable "instance_type_map" {
  description = "EC2 Instance Type Map"
  type = map(string)
  default = {
    "dev" = "t3.micro"
    "qa" = "t3.small"
    "prod" = "t3.large"
  }
}