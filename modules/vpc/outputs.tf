output "vpc_id" {
  value = aws_vpc.P1_vpc.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.internet_gateway.id
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public_subnet_1a.id,
    aws_subnet.public_subnet_2b.id
  ]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private_subnet_3a.id,
    aws_subnet.private_subnet_4b.id
  ]
}