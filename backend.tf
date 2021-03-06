resource "aws_s3_bucket" "b" {
  bucket = "tf-backend-s3-state-file-storage"
  versioning {
    enabled = true
  }

  tags = {
    Name        = "Environment"
    Environment = var.environment
  }
  
}

# create a dynamodb table for locking the state file
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name           = "terraform-state-lock-dynamo"
  hash_key       = "LockID"
  read_capacity  = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}
