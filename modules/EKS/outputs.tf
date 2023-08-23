output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "eks_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "eks_security_group_ids" {
  value = aws_eks_cluster.eks.vpc_config[0].security_group_ids
}
