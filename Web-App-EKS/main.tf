module "vpc" {
  source                      = "../modules/vpc"
  REGION                      = var.REGION
  PROJECT_NAME                = var.PROJECT_NAME
}

module "iam" {
  source                      = "../modules/IAM"
}

module "nat_gateways" {
  source                      = "../modules/nat-gateways"
  VPC_ID                      = module.vpc.VPC_ID
  internet_gateway_id         = module.vpc.internet_gateway_id
  PUBLIC_SUBNET_1A_ID         = module.vpc.PUBLIC_SUBNET_1A_ID
  PUBLIC_SUBNET_2B_ID         = module.vpc.PUBLIC_SUBNET_2B_ID
  PRIVATE_SUBNET_3A_ID        = module.vpc.PRIVATE_SUBNET_3A_ID
  PRIVATE_SUBNET_4B_ID        = module.vpc.PRIVATE_SUBNET_4B_ID
}

module "EKS" {
  source = "../modules/EKS"
  EKS_CLUSTER_ROLE_ARN        = module.iam.EKS_CLUSTER_ROLE_ARN
  PUBLIC_SUBNET_1A_ID         = module.vpc.PUBLIC_SUBNET_1A_ID
  PUBLIC_SUBNET_2B_ID         = module.vpc.PUBLIC_SUBNET_2B_ID
  PRIVATE_SUBNET_3A_ID        = module.vpc.PRIVATE_SUBNET_3A_ID
  PRIVATE_SUBNET_4B_ID        = module.vpc.PRIVATE_SUBNET_4B_ID
}

module "EKS-Node-groups" {
  source                      = "../modules/EKS-Node-groups"
  EKS_CLUSTER_NAME            = module.EKS.EKS_CLUSTER_NAME
  NODE_GROUP_ROLE_ARN         = module.iam.NODE_GROUP_ROLE_ARN
  PRIVATE_SUBNET_3A_ID        = module.vpc.PRIVATE_SUBNET_3A_ID
  PRIVATE_SUBNET_4B_ID        = module.vpc.PRIVATE_SUBNET_4B_ID
}