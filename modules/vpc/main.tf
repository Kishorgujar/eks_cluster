# Public VPC
resource "aws_vpc" "public_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

# Public Subnets
resource "aws_subnet" "public_pub_sub1" {
  count = length(var.public_pub_subnet1_cidrs)
  vpc_id = aws_vpc.public_vpc.id
  cidr_block = element(var.public_pub_subnet1_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "Public_Pub_Sub1-${count.index}"
  }
}

resource "aws_subnet" "public_pub_sub2" {
  count = length(var.public_pub_subnet2_cidrs)
  vpc_id = aws_vpc.public_vpc.id 
  cidr_block = element(var.public_pub_subnet2_cidrs, count.index)
  availability_zone = element(var.azs, count.index + length(var.public_pub_subnet1_cidrs))
  tags = {
    Name = "Public_Pub_Sub2-${count.index}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "public_igw" {
  vpc_id = aws_vpc.public_vpc.id
  tags = {
    Name = "Public_IGW"
  }
}

# Public Route Tables
resource "aws_route_table" "public_pub_route1" {
  vpc_id = aws_vpc.public_vpc.id
  tags = {
    Name = "Public_Pub_Route1"
  }
}

resource "aws_route" "public_route1" {
  route_table_id         = aws_route_table.public_pub_route1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.public_igw.id
}

resource "aws_route_table_association" "public_pub_sub_association1" {
  count          = length(aws_subnet.public_pub_sub1)
  subnet_id      = aws_subnet.public_pub_sub1[count.index].id
  route_table_id = aws_route_table.public_pub_route1.id
}

# Private Subnets
resource "aws_subnet" "private_sub1" {
  count = length(var.private_subnet1_cidrs)
  vpc_id = aws_vpc.public_vpc.id
  cidr_block = element(var.private_subnet1_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "Private_Subnet1-${count.index}"
  }
}

resource "aws_subnet" "private_sub2" {
  count = length(var.private_subnet2_cidrs)
  vpc_id = aws_vpc.public_vpc.id
  cidr_block = element(var.private_subnet2_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "Private_Subnet2-${count.index}"
  }
}

resource "aws_subnet" "private_sub3" {
  count = length(var.private_subnet3_cidrs)
  vpc_id = aws_vpc.public_vpc.id
  cidr_block = element(var.private_subnet3_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "Private_Subnet3-${count.index}"
  }
}

resource "aws_subnet" "private_sub4" {
  count = length(var.private_subnet4_cidrs)
  vpc_id = aws_vpc.public_vpc.id
  cidr_block = element(var.private_subnet4_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name = "Private_Subnet4-${count.index}"
  }
}

# NAT Gateway
resource "aws_eip" "NAT_GW_EIP" {
  tags = {
    Name = "NAT_GW_EIP"
  }
}

resource "aws_nat_gateway" "EKS_NAT" {
  allocation_id = aws_eip.NAT_GW_EIP.id
  subnet_id = aws_subnet.public_pub_sub1[0].id  # Select a valid public subnet
  tags = {
    Name = "EKS_NAT"
  }
}

# Private Route Tables
resource "aws_route_table" "private_route1" {
  vpc_id = aws_vpc.public_vpc.id
  tags = {
    Name = "Private_Route1"
  }
}

resource "aws_route" "private_route1_nat" {
  route_table_id         = aws_route_table.private_route1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.EKS_NAT.id
}

resource "aws_route_table_association" "private_sub1_association" {
  count          = length(aws_subnet.private_sub1)
  subnet_id      = aws_subnet.private_sub1[count.index].id
  route_table_id = aws_route_table.private_route1.id
}

resource "aws_route_table_association" "private_sub2_association" {
  count          = length(aws_subnet.private_sub2)
  subnet_id      = aws_subnet.private_sub2[count.index].id
  route_table_id = aws_route_table.private_route1.id
}

resource "aws_route_table_association" "private_sub3_association" {
  count          = length(aws_subnet.private_sub3)
  subnet_id      = aws_subnet.private_sub3[count.index].id
  route_table_id = aws_route_table.private_route1.id
}

resource "aws_route_table_association" "private_sub4_association" {
  count          = length(aws_subnet.private_sub4)
  subnet_id      = aws_subnet.private_sub4[count.index].id
  route_table_id = aws_route_table.private_route1.id
}
