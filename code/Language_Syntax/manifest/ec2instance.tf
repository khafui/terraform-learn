resource "aws_instance" "myec2vm"{
    ami = "ami-0c41531b8d18cc72b" #us-east-1
    instance_type = "t3.micro"
    user_data = file("${path.module}/app1-install.sh")
    tags = {
        "Name" = "EC2 Demo"
    }
}