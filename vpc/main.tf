resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
      Name = "from_tf"
      env = "dev"
  }
}

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


# resource "aws_subnet" "pub_subnet_1" {
#     vpc_id = aws_vpc.my_vpc.id
#     cidr_block = var.cidr_ranges[0]
#     availability_zone = "us-east-1a"
#     tags = {
#         Name = "pub_subnet_1"
#     }
# }


