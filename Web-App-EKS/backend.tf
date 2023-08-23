# Create S3 bucket
resource "aws_s3_bucket" "terraform_bucket" {
    bucket = "terraform-s3-state-bucket-9494"

    versioning {
        enabled = true
    }

    server_side_encryption_configuration {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm = "AES256"
            }
        }
    }
}


# Create Dynamodb
resource "aws_dynamodb_table" "terraform_statelock" {
    name = "terraform_statelock"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "String"
    }
    
}