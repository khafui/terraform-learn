# terraform native file
# to create a resource
resource "aws_instance" "name"{
    ami = ""
}

resource "aws_instance" "my_ec2" {
    ami = ""
    instance_type = "t2.micro"
    user_data = ""
}