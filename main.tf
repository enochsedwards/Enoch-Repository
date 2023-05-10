# TENACITY VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.chosen_name}-vpc"
  }
}

# Public subnets
resource "aws_subnet" "pub-sub-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.pub-sub-1
  availability_zone = var.az_1_name

  tags = {
    Name = "${var.chosen_name_2}-public_subnet_1"
  }
}

resource "aws_subnet" "pub-sub-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.pub-sub-2
  availability_zone = var.az_2_name

  tags = {
    Name = "${var.chosen_name_2}-public_subnet_2"
  }
}

# Private subnets
resource "aws_subnet" "priv-sub-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.priv-sub-1
  availability_zone = var.az_3_name

  tags = {
    Name = "${var.chosen_name_2}-private_subnet_1"
  }
}

resource "aws_subnet" "priv-sub-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.priv-sub-2
  availability_zone = var.az_4_name

  tags = {
    Name = "${var.chosen_name_2}-private_subnet_2"
  }
}

#Create the Route Tables
resource "aws_route_table" "pub-route-table" {
  vpc_id = aws_vpc.vpc.id

  #this code opens the route table to internet traffic
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags = {
    Name = "${var.chosen_name_2}-pub-route-table"
  }
}


resource "aws_route_table" "priv-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway.id
  }
  depends_on = [aws_internet_gateway.internet-gateway]
  tags = {
    Name = "${var.chosen_name_2}-priv-route-table"
  }
}


#Internet Gateway
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.chosen_name_2}-igw"
  }
}

#NAT Gateway
# creat elastic ip first
resource "aws_eip" "elastic-eip" {

  tags = {
    Name = "${var.chosen_name_2}-elastic-eip"
  }
}

#then associate NAT gateway 
resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = aws_eip.elastic-eip.id
  subnet_id     = aws_subnet.pub-sub-1.id

  tags = {
    Name = "${var.chosen_name_2}-nat-gateway"
  }
}

# Route Table Associations
resource "aws_route_table_association" "public-rt-assoc" {
  subnet_id      = aws_subnet.pub-sub-1.id
  route_table_id = aws_route_table.pub-route-table.id
}


resource "aws_route_table_association" "public-rt1-assoc" {
  subnet_id      = aws_subnet.pub-sub-2.id
  route_table_id = aws_route_table.pub-route-table.id
}


resource "aws_route_table_association" "private-rt1-assoc" {
  subnet_id      = aws_subnet.priv-sub-1.id
  route_table_id = aws_route_table.priv-route-table.id
}

resource "aws_route_table_association" "private-rt2-assoc" {
  subnet_id      = aws_subnet.priv-sub-2.id
  route_table_id = aws_route_table.priv-route-table.id
}


