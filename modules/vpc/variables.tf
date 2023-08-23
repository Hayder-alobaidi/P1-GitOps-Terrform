# VPC total IPs: 65,536 usable IPs
# Each /24 has 256 IPs 

#vpc_cidr             = "10.0.0.0/16"
#public_subnet_1a_cidr = "10.0.0.0/24"
#public_subnet_2b_cidr = "10.0.1.0/24"
#private_subnet_3a_cidr = "10.0.2.0/24"
#private_subnet_4b_cidr = "10.0.3.0/24"

# Please add any new subnet under here : 

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames for the VPC"
  type        = bool
}

variable "internet_gateway_tags" {
  description = "Tags for the Internet Gateway"
  type        = map(string)
}

variable "subnet_cidr_blocks" {
  description = "List of CIDR blocks for subnets"
  type        = list(string)
}

