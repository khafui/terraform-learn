

resource "aws_instance" "myec2vm"{
    ami = var.my_ami 
    instance_type = var.instance_type
    user_data = file("${path.module}/app1-install.sh")
    vpc_security_group_ids = [aws_security_group.allow_tls.id]

    tags = {
        "Name" = "EC2 Demo"
    }
}



