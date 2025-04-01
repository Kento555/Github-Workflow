# Create AWS S3
# resource "aws_s3_bucket" "ws_bucket_github" {
#   bucket = "my-tf-test-with-github-action-bucket" 

#   tags = {
#     Name        = "WS Bucket"
#     Environment = "Dev"
#   }
# }

resource "aws_s3_bucket" "ws_bucket_github" {
  bucket = "my-tf-test-with-github-action-bucket-${random_id.suffix.hex}"
}

resource "random_id" "suffix" {
  byte_length = 4
}
