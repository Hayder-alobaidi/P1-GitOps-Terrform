output "node_group_name" {
  value = aws_eks_node_group.nodes_general.node_group_name
}

output "node_instance_type" {
  value = aws_eks_node_group.nodes_general.instance_type
}

output "node_group_autoscaling_group" {
  value = aws_eks_node_group.nodes_general.autoscaling_groups[0]
}
