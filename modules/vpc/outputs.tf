output "VPC_ID" {
  value = aws_vpc.P1_vpc.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.internet_gateway.id
}

output "PUBLIC_SUBNET_1A_ID" {
  value = aws_subnet.public_subnet_1a.id
}

output "PUBLIC_SUBNET_2B_ID" {
  value = aws_subnet.public_subnet_2b.id
}

output "PRIVATE_SUBNET_3A_ID" {
  value = aws_subnet.private_subnet_3a.id
}

output "PRIVATE_SUBNET_4B_ID" {
  value = aws_subnet.private_subnet_4b.id
}
