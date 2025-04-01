# Create AWS S3
resource "aws_s3_bucket" "ws_bucket_github" {
  bucket = "my-tf-test-with-github-action-bucket" 

  tags = {
    Name        = "WS Bucket"
    Environment = "Dev"
  }
}