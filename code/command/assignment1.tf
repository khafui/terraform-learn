/*
    A simple project 
    1. create a new folder / directory called Project1
    2. Create a VPC named "FirstVPC"
    3. CIDR range : 192.168.0.0/24


    Solution

    provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "FirstVPC"{
    cidr_block = "192.168.0.0/24" 
    tags = {
        "Name" = "Firstvpc"
    }
}
*/