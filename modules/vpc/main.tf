# VPC total IPs: 65,536 usable IPs
# Each /24 has 256 IPs 


# Create the VPC 
resource "aws_vpc" "P1_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "${var.PROJECT_NAME}-vpc"
    Environment = "prod"
  }
}

# create internet gateway and attach it to vpc
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.P1_vpc.id

  tags = {
    Name = "${var.PROJECT_NAME}-igw"
    Environment = "prod"
  }
}

# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}


resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = aws_vpc.P1_vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone      = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

   tags = {
    Name                        = "public_subnet_1a"
    "kubernetes.io/cluster/${var.PROJECT_NAME}" = "shared"
    "kubernetes.io/role/elb"    = 1

  }
}

resource "aws_subnet" "public_subnet_2b" {
  vpc_id                  = aws_vpc.P1_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone      = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

 tags = {
    Name                        = "public_subnet_2b"
    "kubernetes.io/cluster/${var.PROJECT_NAME}" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "private_subnet_3a" {
  vpc_id     = aws_vpc.P1_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = data.aws_availability_zones.available_zones.names[0]

  tags = {
    Name                              = "private_subnet_3a"
    "kubernetes.io/cluster/${var.PROJECT_NAME}"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}

resource "aws_subnet" "private_subnet_4b" {
  vpc_id     = aws_vpc.P1_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = data.aws_availability_zones.available_zones.names[1]

   tags = {
    Name                              = "private_subnet_4b"
    "kubernetes.io/cluster/${var.PROJECT_NAME}"       = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }
}

