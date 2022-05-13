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
    # cidr_block = var.cidr_ranges[count.index]
    cidr_block = cidrsubnet(var.vpc_cidr,8,count.index)
    # availability_zone = var.availaibility_zones[count.index]
    availability_zone = "${var.region}${count.index%2==0?"a":"b"}"
    depends_on = [
        aws_vpc.my_vpc
    ]
    tags = {
        # Name = "web-${count.index}"
        Name = local.subnets[count.index]
        # Name_alternate = var.subnets[count.index]
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

##<----Creating internet gateway------>###
resource "aws_internet_gateway" "myvpc_ig" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = local.igw_myvpc_igw
    }
    depends_on = [aws_vpc.my_vpc]
    
}

##<----Creating route table------>###

resource "aws_route_table" "pub_rt" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = local.anywhere
        gateway_id = aws_internet_gateway.myvpc_ig.id
    }
    depends_on = [aws_vpc.my_vpc,aws_subnet.subnets[0],aws_subnet.subnets[1]]

    tags = {
        Name = "Public_subnet_rt"
    }
}

##<----Associate route tables with web/public subnets------>###

resource "aws_route_table_association" "webrt_association" {
    count = 2
    #subnet_id      = aws_subnet.subnets[0].id
    subnet_id      = aws_subnet.subnets[count.index].id
    route_table_id = aws_route_table.pub_rt.id

    depends_on = [aws_route_table.pub_rt]
}
