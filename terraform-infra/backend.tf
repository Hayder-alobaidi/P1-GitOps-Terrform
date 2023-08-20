# Create S3 bucket
resource "aws_s3_bucket "terrformbucket" {
    name = "terrfroms3statebucket9494"
    versioning {
        enabled = true
    }
    server_side_encryption_configuration = {
        rule {
            apply_server_side_encryption_by_default {
                sse_algorithm     = "AES256"
  }
}
}
}