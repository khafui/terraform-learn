

resource "aws_instance" "myec2vm"{
    /* ami = var.my_ami  */
    ami = data.aws_ami.amazonlinux2.id #data source for dynamic data
    instance_type = var.instance_type
    user_data = file("${path.module}/app1-install.sh")
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    /* key_name = var.key_pair #adding of key */

    tags = {
        "Name" = "EC2 Demo"
    }
}



