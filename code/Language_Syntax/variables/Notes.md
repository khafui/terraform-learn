### **Variable**
- A variable is a value that can change, depending on conditions or information passed to the program
- Variables are used to store information to be referenced and manipulated in a computer program.
- They also provide a way of labelling data with a descriptive name, so our programs can be understood more clearly by the reader and ourselves.
- It is helpful to think of variables as containers that can hold information. Their sole purpose is to label and store data in memory. This data can then be used throughout your program.

## Supported Variables in Terraform
# String
- Strings are usually represented by a double-quoted sequence of unicode characters, "like this"

variable "vpcname" {
    type = string
    default = "myvpc"
}

# Number
- Numbers are represented by unquoted sequences of digits with or without a decimal point, like 15 or 6.23032.

variable "sshport" {
    type = number
    default = 22
}

# Boolean
- Booleans are represented by unqoted symbols true or false

variable "enabled" {
    default = false
}

# List (ie Array)
- Lists are represented by a pair of square brackets containing a comma-seperated sequence of values, like ["a", 15, true].

variable "mylist" {
    type = list(string)
    default = ["value1", "value2"]
}

# How to reference List values ?
instance_type = var.mylist[1]


# Map {object}
- Map/objects are represented by a pair of curly braces containing a series of <key> = <value> pairs:

variable "mymap" {
    type = map
    default = {
        key1 = "value1",
        key2 = "value2"
    }
}

How to reference Map values
instance_type -var.mymap["key1"] 

# Input
variable "inputname" {
    type = string
    description = "Set the name of the VPC"
}

#note that if no default value is provided, then the variable will ne an input variable and will propmt ypu to enter a value at runtime

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = var.inputname
    }
}

# Output
output "vpcid" {
    value = aws_vpc.myvpc.id
}

# Tuple 
- List/tuples are represented by a pair of square brackets containing a comma-seperated sequence sequence of values like ["A", 15, true]

variable "mytuple" {
    type = tuple([string, number, string])
    default = ["cat",1,"dog"]
}

# Objects 
variable "myobjec" {
    type =object ({ name = string, port = list(number)})
    default = {
        name = "Landmark",
        port = [22,25,80]
    }
}