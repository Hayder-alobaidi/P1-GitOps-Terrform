# Create an IAM role for general EKS worker nodes
resource "aws_iam_role" "nodes_general" {
  name = "eks-node-group-general"

  # Define the policy that allows EC2 instances to assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach AmazonEKS_CNI_Policy to the IAM role for CNI networking
resource "aws_iam_role_policy_attachment" "amazon_eks_cni_policy_general" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodes_general.name
}

# Attach AmazonEC2ContainerRegistryReadOnly policy to the IAM role for read-only ECR access
resource "aws_iam_role_policy_attachment" "amazon_ec2_container_registry_read_only" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodes_general.name
}

# Attach AmazonEKSWorkerNodePolicy to the IAM role for general EKS worker nodes
resource "aws_iam_role_policy_attachment" "amazon_eks_worker_node_policy_general" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodes_general.name
}

# Create an EKS node group for general worker nodes
resource "aws_eks_node_group" "nodes_general" {
  cluster_name = var.eks_cluster_name

  node_group_name = "nodes-general"

  # IAM role for the node group
  node_role_arn = aws_iam_role.nodes_general.arn

  # Subnets for the node group
  subnet_ids = [
    aws_subnet.private_subnet_3a,
    aws_subnet.private_subnet_4b
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

  # Ensure the node group creation depends on IAM policy attachments
  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_worker_node_policy_general,
    aws_iam_role_policy_attachment.amazon_eks_cni_policy_general,
    aws_iam_role_policy_attachment.amazon_ec2_container_registry_read_only,
  ]
}
