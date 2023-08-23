# Create the EKS cluster
resource "aws_eks_cluster" "eks" {
  # Name of the cluster
  name = "eks"

  # ARN of the IAM role that EKS will assume
  role_arn = aws_eks_cluster.eks.arn 

  # Version of EKS to use
  version = "1.27"

  # VPC configuration
  vpc_config {
    # Whether private access to EKS API server is enabled
    endpoint_private_access = false

    # Whether public access to EKS API server is enabled
    endpoint_public_access = true

    # List of subnet IDs where EKS resources will be placed
    subnet_ids = [
      public_subnet_1a.id,
      public_subnet_2b.id,
      private_subnet_3a.id,
      private_subnet_4b.id
    ]
  }

  # Ensure the EKS cluster creation depends on IAM policy attachment
  depends_on = [ 
    aws_iam_role_policy_attachment.amazon_eks_cluster_policy
  ]
}
