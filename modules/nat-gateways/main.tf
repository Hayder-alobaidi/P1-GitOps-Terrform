# Create Elastic IP resources for NAT Gateways
resource "aws_eip" "nat1" {
  # These Elastic IPs depend on the Internet Gateway being created first
  depends_on = [var.internet_gateway_id]
}

resource "aws_eip" "nat2" {
  depends_on = [var.internet_gateway_id]
}

# Create NAT Gateway resources
resource "aws_nat_gateway" "gw1" {
  # Allocate the Elastic IP created earlier
  allocation_id = aws_eip.nat1.id

  # Associate this NAT Gateway with the public subnet (public_subnet_1a)
  subnet_id = var.PUBLIC_SUBNET_1A_ID

  # Assign a tag for easy identification
  tags = {
    Name = "NAT 1"
  }
}

resource "aws_nat_gateway" "gw2" {
  allocation_id = aws_eip.nat2.id
  subnet_id     = var.PUBLIC_SUBNET_2B_ID

  tags = {
    Name = "NAT 2"
  }
}

# Create public route table
resource "aws_route_table" "public" {
  # Associate this route table with the VPC created earlier (P1_vpc)
  vpc_id = var.VPC_ID

  # Create a default route through the Internet Gateway (P1_vpc)
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  # Assign a tag for easy identification
  tags = {
    Name = "public"
  } 
}

# Create private route tables with NAT Gateway routes
resource "aws_route_table" "private1" {
  vpc_id = var.VPC_ID 

  # Create a default route through the NAT Gateway gw1
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw1.id
  }

  # Assign a tag for easy identification
  tags = {
    Name = "private"
  } 
}

resource "aws_route_table" "private2" {
  vpc_id = var.VPC_ID

  # Create a default route through the NAT Gateway gw2
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw2.id
  }

  # Assign a tag for easy identification
  tags = {
    Name = "private"
  } 
}

# Associate public and private route tables with respective subnets
resource "aws_route_table_association" "public1" {
  # Associate the public route table with the public subnet public_subnet_1a
  subnet_id      = var.PUBLIC_SUBNET_1A_ID
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  # Associate the public route table with the public subnet public_subnet_2b
  subnet_id      = var.PUBLIC_SUBNET_2B_ID
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private1" {
  # Associate the private route table with the private subnet private_subnet_3a
  subnet_id      = var.PRIVATE_SUBNET_3A_ID
  route_table_id = aws_route_table.private1.id
}

resource "aws_route_table_association" "private2" {
  # Associate the private route table with the private subnet private_subnet_4b
  subnet_id      = var.PRIVATE_SUBNET_4B_ID
  route_table_id = aws_route_table.private2.id
}





