output "internet_gateway_id" {
  description = "ID of the created internet gateway"
  value       = aws_internet_gateway.internet_gateway.id
}

output "nat_gateway_ids" {
  description = "IDs of the created NAT gateways"
  value       = [
    aws_nat_gateway.gw1.id,
    aws_nat_gateway.gw2.id
  ]
}
