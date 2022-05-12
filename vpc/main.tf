provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "192.168.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
      Name = "from_tf"
  }
}