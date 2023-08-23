variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
}

variable "node_subnet_ids" {
  description = "List of subnet IDs for the node group"
  type        = list(string)
}

variable "node_role_arn" {
  description = "ARN of the IAM role for EKS worker nodes"
}

variable "eks_version" {
  description = "Version of EKS to use"
}

variable "desired_node_size" {
  description = "Desired size of the node group"
  type        = number
}

variable "node_instance_type" {
  description = "Instance type for the node group"
}

variable "ami_type" {
  description = "Type of AMI for the node group"
}

variable "capacity_type" {
  description = "Capacity type for the node group"
}
