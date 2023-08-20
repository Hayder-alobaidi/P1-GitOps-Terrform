terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0" # any version grater than 4.0 
    }
  }
}

provider "aws" {
  # Configuration options
  region = var.REGION
}