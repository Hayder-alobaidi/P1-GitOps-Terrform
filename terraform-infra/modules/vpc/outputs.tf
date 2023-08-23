output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.P1_vpc.id
}

output "public_subnet_ids" {
  description = "IDs of the created public subnets"
  value       = [
    aws_subnet.public_subnet_1a.id,
    aws_subnet.public_subnet_2b.id
  ]
}

output "private_subnet_ids" {
  description = "IDs of the created private subnets"
  value       = [
    aws_subnet.private_subnet_3a.id,
    aws_subnet.private_subnet_4b.id
  ]
}
