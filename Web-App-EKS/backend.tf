terraform {
  backend "s3" {
    bucket = "terraform-s3-state-bucket-9494"
    dynamodb_table = "terraform_statelock"
    key = "global/mystatefile/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0" # any version grater than 4.0 
    }
  }
}