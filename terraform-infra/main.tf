# main.tf

module "vpc" {
  source = "./vpc"  # Path to the VPC module directory

  PROJECT_NAME = var.PROJECT_NAME
  VPC_CIDR = var.VPC_CIDR
  PUBLIC_SUBNET_CIDR_1A = var.PUBLIC_SUBNET_CIDR_1A
  PUBLIC_SUBNET_CIDR_2B = var.PUBLIC_SUBNET_CIDR_2B
  PRIVATE_SUBNET_CIDR_3A = var.PRIVATE_SUBNET_CIDR_3A
  PRIVATE_SUBNET_CIDR_4B = var.PRIVATE_SUBNET_CIDR_4B
}

module "internet_gateway" {
  source = "./internet_gateway"  # Path to the Internet Gateway module directory

  VPC_ID = module.vpc.vpc_id
  PROJECT_NAME = var.PROJECT_NAME
}

module "nat_gateway_routing" {
  source = "./nat_gateway_routing"  # Path to the NAT Gateway and Routing module directory

  VPC_ID = module.vpc.vpc_id
  PROJECT_NAME = var.PROJECT_NAME
}

module "iam_role" {
  source = "./iam_role"  # Path to the IAM Role module directory

  PROJECT_NAME = var.PROJECT_NAME
}
