provider "aws" {
    # region = "us-east-1"
    region = var.region
    shared_credentials_files = ["/Users/tejesh.karri/.aws/credentails"]
}

resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
      Name = "from_tf"
      env = "dev"
  }
}

resource "aws_subnet" "pub_subnet_1" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.sub1_cidr
    availability_zone = "us-east-1a"
    tags = {
        Name = "pub_subnet_1"
    }
}

resource "aws_subnet" "pub_subnet_2" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.sub2_cidr
    availability_zone = "us-east-1b"
    tags = {
        Name = "pub_subnet_2"
    }
}

variable "region" {
    default = "us-east-1"
    type = string
}

variable "vpc_cidr" {
    default = "192.168.0.0/16"
}

variable "sub1_cidr" {
  default = "192.168.1.0/24"
}

variable "sub2_cidr" {
    default = "192.168.2.0/24"
}
