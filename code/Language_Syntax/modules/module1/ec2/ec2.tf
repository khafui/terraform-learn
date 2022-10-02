resource "aws_instance" "ec2" {
    ami = data.aws_ami.amzlinux2.id
    instance_type = var.ec2inst_type
    tags ={
        Name = var.ec2name
    }
}