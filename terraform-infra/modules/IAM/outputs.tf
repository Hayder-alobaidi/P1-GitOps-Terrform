output "iam_role_name" {
  description = "Name of the created IAM role"
  value       = aws_iam_role.eks_cluster.name
}
