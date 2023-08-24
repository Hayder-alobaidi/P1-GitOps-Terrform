
# Create an EKS node group for general worker nodes
resource "aws_eks_node_group" "nodes_general" {
  cluster_name = var.EKS_CLUSTER_NAME

  node_group_name = "${var.EKS_CLUSTER_NAME}-NODE-GROUP"

  # IAM role for the node group
  node_role_arn = var.NODE_GROUP_ROLE_ARN

  # Subnets for the node group
  subnet_ids = [
    var.PRIVATE_SUBNET_3A_ID,
    var.PRIVATE_SUBNET_4B_ID
  ]

  # Scaling configuration for the node group
  scaling_config {
    desired_size = 3
    max_size     = 3
    min_size     = 3
  }

  # AMI type and instance configuration
  ami_type        = "AL2_x86_64"
  capacity_type   = "ON_DEMAND"
  disk_size       = 20
  force_update_version = false
  instance_types  = ["t3.small"]

  # Labels for the node group
  labels = {
    role = "nodes-general"
  }

  # Kubernetes version for the node group
  version = "1.27"

}
