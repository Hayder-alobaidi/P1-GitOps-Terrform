module "vpc" {
  source = "../modules/vpc"  # Path to the VPC module directory

  PROJECT_NAME          = var.PROJECT_NAME
  VPC_CIDR              = var.VPC_CIDR
  PUBLIC_SUBNET_CIDR_1A = var.PUBLIC_SUBNET_CIDR_1A
  PUBLIC_SUBNET_CIDR_2B = var.PUBLIC_SUBNET_CIDR_2B
  PRIVATE_SUBNET_CIDR_3A = var.PRIVATE_SUBNET_CIDR_3A
  PRIVATE_SUBNET_CIDR_4B = var.PRIVATE_SUBNET_CIDR_4B
}

module "internet_gateway" {
  source = "../modules/nat-gateways"  # Path to the Internet Gateway module directory

  VPC_ID       = module.vpc.vpc_id
  PROJECT_NAME = var.PROJECT_NAME
}

module "IAM" {
  source = "../modules/IAM"  # Path to the IAM Role module directory

  PROJECT_NAME = var.PROJECT_NAME
}

module "EKS" {
  source       = "../modules/EKS"  # Path to the EKS module directory
  PROJECT_NAME = var.PROJECT_NAME
}

module "NODE_GROUP" {
  source           = "../modules/EKS-Node-groups"  # Path to the Node Group module directory
}
