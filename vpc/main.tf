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

# resource "aws_subnet" "pub_subnet_1" {
#     vpc_id = aws_vpc.my_vpc.id
#     cidr_block = var.cidr_ranges[0]
#     availability_zone = "us-east-1a"
#     tags = {
#         Name = "pub_subnet_1"
#     }
# }

resource "aws_subnet" "subnets" {
    vpc_id = aws_vpc.my_vpc.id
    count = 6
    cidr_block = var.cidr_ranges[count.index]
    availability_zone = var.availaibility_zones[count.index]
    tags = {
        Name = "web-${count.index}"
        Name_alternate = var.subnets[count.index]
    }
}

variable "subnets" {
    type = list(string)
    default = ["App1", "App2", "App3", "App4","App5","App6"]
    description = "Name of subnets"
}

variable "cidr_ranges" {
    type = list(string)
    default = ["192.168.1.0/24","192.168.2.0/24","192.168.3.0/24","192.168.4.0/24","192.168.5.0/24","192.168.6.0/24"]
    description = "cidr ranges for all subnets"
}

variable "availaibility_zones" {
    type = list(string)
    default = ["us-east-1a","us-east-1b","us-east-1c","us-east-1d","us-east-1e","us-east-1f"]
}

variable "region" {
    default = "us-east-1"
}

variable "vpc_cidr" {
    default = "192.168.0.0/16"
}
