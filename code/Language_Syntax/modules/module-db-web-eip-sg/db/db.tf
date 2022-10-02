variable "inst_type" {
    type = string
    default = "t2.micro"
}

resource "aws_instance" "db"{
    ami = data.aws_ami.amzlinux2.id
    instance_type = var.inst_type

    tags = {
        Name = "DB Server"
    }
}

output "PrivateIP"{
    value = aws_instance.db.private_ip
}