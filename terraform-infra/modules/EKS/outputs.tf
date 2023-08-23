# Output the EKS cluster name
output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}

# Output the EKS cluster endpoint
output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

