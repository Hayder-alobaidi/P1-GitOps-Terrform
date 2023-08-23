variable "eks_name" {
  description = "Name of the EKS cluster"
}

variable "eks_role_arn" {
  description = "ARN of the IAM role for EKS"
}

variable "eks_version" {
  description = "Version of EKS to use"
}
