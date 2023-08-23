provider "aws" {
  region = "us-west-2"  # Update with your desired AWS region
}

module "vpc" {
  source = "../modules/vpc"

  vpc_cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames     = true
  internet_gateway_tags    = {
    Name        = "MyInternetGateway"
    Environment = "Production"
  }
  subnet_cidr_blocks       = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

module "iam" {
  source = "../modules/IAM"

  eks_cluster_name = module.eks_cluster.eks_cluster_name
  eks_role_name    = "eks-cluster"
}

module "nat_gateways" {
  source = "../modules/nat-gateways"
  # No specific variables required for this module
}

module "eks_cluster" {
  source = "../modules/EKS"

  eks_name        = "eks-cluster"
  eks_role_arn    = module.iam.eks_role_arn
  eks_version     = "1.27"
  
}

module "eks_node_groups" {
  source = "../modules/EKS-node-groups"

  eks_cluster_name    = module.eks_cluster.eks_cluster_name
  node_subnet_ids    = module.vpc.private_subnet_ids
  node_role_arn      = module.iam.eks_role_arn
  eks_version        = "1.27"
  desired_node_size  = 3
  node_instance_type = "t3.small"
  ami_type           = "AL2_x86_64"
  capacity_type      = "ON_DEMAND"
}

# Optional: Define outputs for any relevant information you want to access from the modules
output "eks_cluster_name" {
  value = module.eks_cluster.eks_cluster_name
}

output "node_group_name" {
  value = module.eks_node_groups.node_group_name
}

# Add outputs from other modules as needed
