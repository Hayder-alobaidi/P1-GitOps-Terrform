# Create S3 bucket
resource "aws_s3_bucket" "terraform_bucket" {
    bucket = "terraform-s3-state-bucket-9494"

    lifecycle {
      prevent_destroy = true
    }

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
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
}
