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
      var.public_subnet_ids[0],  # This is the first subnet in the list
      var.public_subnet_ids[1],  # This is the second subnet in the list
      var.private_subnet_ids[0], # This is the first private subnet in the list
      var.private_subnet_ids[1]  # This is the second subnet in the list
    ]
  }

  # Ensure the EKS cluster creation depends on IAM policy attachment
  depends_on = [ 
    aws_iam_role_policy_attachment.amazon_eks_cluster_policy
  ]
}
