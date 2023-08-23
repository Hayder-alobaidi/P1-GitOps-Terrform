# Declare variables for subnet IDs
variable "public_subnet_1a_id" {
  description = "ID of the public subnet in Availability Zone 1a"
}

variable "public_subnet_2b_id" {
  description = "ID of the public subnet in Availability Zone 2b"
}

variable "private_subnet_3a_id" {
  description = "ID of the private subnet in Availability Zone 3a"
}

variable "private_subnet_4b_id" {
  description = "ID of the private subnet in Availability Zone 4b"
}

# Declare variable for the EKS cluster's IAM role ARN
variable "eks_cluster_role_arn" {
  description = "ARN of the IAM role for the EKS cluster"
}
