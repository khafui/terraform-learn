output "for_output_list_loop1" {
    description = "for loop with list"
    value = [for instance in aws_instance.ec2: instance.public_dns]
  #value = "Instances: ${element(aws_instance.ec2.*.id, 0)}"
}

/* output - loop with map */
output "for_output_map1" {
    description = "for loop with map"
    value = [for instance in aws_instance.ec2: instance.public_dns]
    #value = "Instances: ${element(aws_instance.ec2.*.id, 0)}"
}

output "for_output_list_loop2" {
    description = "for loop with list"
    value = [for instance in aws_instance.ec2: instance.subnet_id]
  #value = "Instances: ${element(aws_instance.ec2.*.id, 0)}"
}

/* output - loop with map */
output "for_output_map2" {
    description = "for loop with map"
    value = [for instance in aws_instance.ec2: instance.subnet_id]
    #value = "Instances: ${element(aws_instance.ec2.*.id, 0)}"
}