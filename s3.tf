# Create AWS S3
resource "aws_s3_bucket" "ws_bucket" {
  bucket = "my-tf-test-with-github-action-bucket" # Change to a globally unique name

  tags = {
    Name        = "WS Bucket"
    Environment = "Dev"
  }
}