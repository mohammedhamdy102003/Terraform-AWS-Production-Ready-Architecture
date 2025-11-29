resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "main_vpc"
    }
  
}
resource "aws_subnet" "public_subnet_a" {
    vpc_id=aws_vpc.main.id
    cidr_block = var.public_subnets_cidrs[0]
    availability_zone = var.azs[0]
    map_public_ip_on_launch = true
    tags = {
        Name = "public_subnet_a"
    }
  
}
resource "aws_subnet" "public_subnet_b" {
    vpc_id=aws_vpc.main.id
    cidr_block = var.public_subnets_cidrs[1]
    availability_zone = var.azs[1]
    map_public_ip_on_launch = true
    tags = {
        Name = "public_subnet_a"
    }
  
}
resource "aws_subnet" "private_subnet_a" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnets_cidrs[0]
    availability_zone = var.azs[0]
    tags = {
        Name = "private_subnet_a"
    }
  
}
resource "aws_subnet" "private_subnet_b" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.private_subnets_cidrs[1]
    availability_zone = var.azs[1]
    tags = {
        Name = "private_subnet_b"
    }
  
}
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "main_igw"
    }
  
}
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "public_route_table"
    }
    route ={
        cidr_block = "0.0.0.0/0"
        gateway_id=aws_internet_gateway.igw.id

    }
  
}
resource "aws_route_table_association" "public_rt_assoc_a" {
    subnet_id = aws_subnet.public_subnet_a.id
    route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "public_rt_assoc_b" {
    subnet_id = aws_subnet.public_subnet_b.id
    route_table_id = aws_route_table.public_route_table.id
}
resource "aws_eip" "nat_eip" {
    domain = "vpc"
    count = var.enable_nat_gateway ? 1 : 0
    tags = {
        Name = "nat_eip"
    }

}
resource "aws_nat_gateway" "nat_gw" {
    allocation_id = aws_eip.nat_eip[0].id
    subnet_id = aws_subnet.public_subnet_a.id
    count = var.enable_nat_gateway ? 1 : 0
    depends_on = [ "aws_internet_gateway.igw" ]
    tags = {
        Name = "nat_gw"
    }
}
resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "private_route_table"
    }
    route = {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gw[0].id 
    }

}
resource "aws_route_table_association" "private_rt_assoc_a" {
    subnet_id = aws_subnet.private_subnet_a.id
    route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_rt_assoc_b" {
    subnet_id = aws_subnet.private_subnet_b.id
    route_table_id = aws_route_table.private_route_table.id
}
