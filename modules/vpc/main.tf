
# locals {
#   vpc_name = "${terraform.workspace}"
# }
# Create VPC
resource "aws_vpc" "chatbot-app" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    #Name = "${var.environment}-vpc"
    Name = "${terraform.workspace}-ChatbotVPC"
  }
}

# Create Public Subnets
resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.chatbot-app.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  map_public_ip_on_launch = true
  availability_zone       = element(var.availability_zones, count.index)
  tags = {
    Name = "${terraform.workspace}-public-subnet-${count.index + 1}"
  }
}

# Create Private Subnets
resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.chatbot-app.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = element(var.availability_zones, count.index)
  tags = {
    Name = "${terraform.workspace}-private-subnet-${count.index + 1}"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.chatbot-app.id
  tags = {
    Name = "${terraform.workspace}-igw"
  }
}

# Create NAT Gateway in the first public subnet
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# resource "aws_eip" "nat_eip" {
#   for_each = toset(aws_subnet.public[*].id)
#   domain   = "vpc"
# }

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public[0].id
  tags = {
    Name = "${terraform.workspace}-NatGateway"
  }
}

# resource "aws_nat_gateway" "nat" {
#   for_each = toset(aws_subnet.public[*].id)

#   allocation_id = aws_eip.nat_eip[each.key].id
#   subnet_id     = each.key

#   tags = {
#     Name = "${var.environment}-nat-gateway-${each.key}"
#   }
# }

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.chatbot-app.id
  tags = {
    Name = "${terraform.workspace}-PublicRouteTable"
  }
}

# Public Route
resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Associate Public Subnets with Public Route Table
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.chatbot-app.id
  tags = {
    Name = "${terraform.workspace}-PrivateRouteTable"
  }
}

# Private Route (via NAT Gateway)
resource "aws_route" "private_nat_gateway" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}

# Associate Private Subnets with Private Route Table
resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}


