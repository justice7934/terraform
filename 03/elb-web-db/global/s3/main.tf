#####################################
# 1. provider
# 2. S3 bucket 생성
#####################################

#####################################
# 1. provider
#####################################
provider "aws" {
  region = "us-east-2"
}

#####################################
# 2. S3 bucket 생성
#####################################
resource "aws_s3_bucket" "mytfstate" {
  bucket = "myjustice-7979"

  tags = {
    Name        = "mytfstate"
  }
}

# * S3 bucket ARN -> output
# * DynamoDB table name -> output
# resource "aws_dynamodb_table" "mylocktable" {
#   name           = "mylocktable"
#   billing_mode   = "PROVISIONED"
#   read_capacity  = 20
#   write_capacity = 20
#   hash_key       = "LockID"


#   attribute {
#     name = "LockID"
#     type = "S"
#   }

#   tags = {
#     name = "mylocktable"
#   }
# }