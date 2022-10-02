resource "aws_instance" "ec2" {
  ami = data.aws_ami.amazonlinux2.id
  #instance_type = var.instance_type
  instance_type = var.instance_type_list[1] #for list
  #instance_type = var.instance_type_map["dev"] #for map
  /* instance_type = var.my_instance_type */
  user_data       = file("${path.module}/app1-install.sh")
  security_groups = [aws_security_group.web-traffic.name]
  #vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  #meta-arguement are arguements that alter the state of the resource
  count = 1

  tags = {
    "Name" = "Prod-${count.index}"
  }
}


/* 
    drawbacks using count in this example
    -resource instances in this case were identified  using the index numbers
    instead of string values like actual subnet_id
    -if an element was removed from the middle oof the list,
    every instance after that element would see its subnet_id value
    change, resulting in more remote object changes than intended
    -even the subnet_ids should be pre-defined or we need to get them again
    using for_each or using various datasources
    -using for_each gives flexibility without the extra churn.
 */
