provider "aws" {
    region = var.region
    # access_key = "AKIARDIRSBQ455NRSHW3"
    # secret_key = "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"
    shared_credentials_files = ["/Users/tejesh.karri/.aws/credentails"]
}

resource "aws_vpc" "test_vpc" {
    cidr_block = var.vpc_cidr
    
    tags = {
        Name = "test-vpc"
        Env = "De-test"
    }

}

resource "aws_subnet" "pub_subnets" {
    vpc_id = aws_vpc.test_vpc.id
    count = 2
    # cidr_block = var.sub_cidr_range[count.index]
    cidr_block = cidrsubnet(var.vpc_cidr, 8, count.index)
    
    tags = {
        Name = local.subnet_name[count.index]
    }
}


variable "vpc_cidr" {
    default = "192.168.0.0/16"
    type = string
}

# variable "sub_cidr_range" {
#     type = list(string)
#     default = ["192.168.3.0/24","192.168.4.0/24"]
# }


variable "region" {
    default = "us-east-1"
}

# variable "sub_name" {
#     type = list(string)
#     default = ["pub_subnet_1","pub_subnet_2"]
# }

locals {
    subnet_name = ["pub_subnet_1","pub_subnet_2"]
}