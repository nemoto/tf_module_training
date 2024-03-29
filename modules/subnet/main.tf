terraform {
  required_version = ">= 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.20.0"
    }
  }
}

## PUBLIC SUBNET
# create public subnets
resource "aws_subnet" public_subnet {
  # identify parent VPC
  vpc_id = var.vpc_id
  # create subnet on zone 1a
  availability_zone = var.subnet_az
  cidr_block        = var.subnet_private_cidr_for_public
  map_public_ip_on_launch = false #EIPを使うので自動設定はOFF
  tags = {
    Name = "${var.proj}-${var.env}-${var.name}-public_subnet_${var.az}"
    terraform = true
  }
}

# create route table (for public)
resource "aws_route_table" route_table_public {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.proj}-${var.env}-${var.name}-route_table_public_${var.az}"
    terraform = true
  }
}

# create route into table (public)
resource "aws_route" route_public {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.route_table_public.id
  gateway_id             = var.igw_id
}

# create association routes and subnets (public)
resource "aws_route_table_association" route_association_public {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table_public.id
}

## PRIVATE SUBNET
# create private subnets
resource "aws_subnet" private_subnet {
  # identify parent VPC
  vpc_id = var.vpc_id
  availability_zone = var.subnet_az
  cidr_block        = var.subnet_private_cidr_for_private
  tags = {
    Name = "${var.proj}-${var.env}-${var.name}-private_subnet_${var.az}"
    terraform = true
  }
}

# create NAT for private subnet
resource "aws_nat_gateway" NAT_private_subnet {
  # set public submet for NAT gateway
  subnet_id     = aws_subnet.private_subnet.id
  # set EIP for the NAT gateway
  allocation_id = var.eip_id
  tags = {
    Name = "${var.proj}-${var.env}-${var.name}-NAT_private_subnet_${var.az}"
    terraform = true
  }
}

# create route table (private)
resource "aws_route_table" route_table_private {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.proj}-${var.env}-${var.name}-route_table_private_${var.az}"
    terraform = true
  }
}
# create each route (private)
resource "aws_route" route_private {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = aws_route_table.route_table_private.id
  nat_gateway_id         = aws_nat_gateway.NAT_private_subnet.id
}
# 3-3-3. create association routes and subnets (private)
resource "aws_route_table_association" route_association_private {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.route_table_private.id
}
