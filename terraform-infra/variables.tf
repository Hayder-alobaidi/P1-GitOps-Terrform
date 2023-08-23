REGION       = "us-east-1"
PROJECT_NAME = "Web-App-EKS"

# use data source to get all avalablility zones in region
data "aws_availability_zones" "available_zones" {}


