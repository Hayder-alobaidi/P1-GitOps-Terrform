# Create the EKS cluster
resource "aws_eks_cluster" "eks" {
  # Name of the cluster
  name = "eks"

  # ARN of the IAM role that EKS will assume
  role_arn = var.EKS_CLUSTER_ROLE_ARN

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
      var.PUBLIC_SUBNET_1A_ID,
      var.PUBLIC_SUBNET_2B_ID,
      var.PRIVATE_SUBNET_3A_ID,
      var.PRIVATE_SUBNET_4B_ID
    ]
  }


}