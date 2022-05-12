provider "aws" {
    region = "us-east-1"
    shared_credentials_files = ["/Users/tejesh.karri/.aws/credentails"]
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "192.168.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
      Name = "from_tf"
      env = "dev"
  }
}

resource "aws_subnet" "pub_subnet_1" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "192.168.1.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "pub_subnet_1"
    }
}

resource "aws_subnet" "pub_subnet_2" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "192.168.2.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name = "pub_subnet_2"
    }
}
