# VPC total IPs: 65,536 usable IPs
# Each /24 has 256 IPs 

#vpc_cidr             = "10.0.0.0/16"
#public_subnet_1a_cidr = "10.0.0.0/24"
#public_subnet_2b_cidr = "10.0.1.0/24"
#private_subnet_3a_cidr = "10.0.2.0/24"
#private_subnet_4b_cidr = "10.0.3.0/24"

# Please add any new subnet under here : 



variable "VPC_CIDR" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "PROJECT_NAME" {
  description = "Name of the project"
  type        = string
}

variable "PUBLIC_SUBNET_CIDR_1A" {
  description = "CIDR block for the public subnet in availability zone 1a"
  type        = string
}

variable "PUBLIC_SUBNET_CIDR_2B" {
  description = "CIDR block for the public subnet in availability zone 2b"
  type        = string
}

variable "PRIVATE_SUBNET_CIDR_3A" {
  description = "CIDR block for the private subnet in availability zone 3a"
  type        = string
}

variable "PRIVATE_SUBNET_CIDR_4B" {
  description = "CIDR block for the private subnet in availability zone 4b"
  type        = string
}
