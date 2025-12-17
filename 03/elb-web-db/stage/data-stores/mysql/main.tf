######################################
# 1. provider 설정
# 2. DB(MySQL) 생성
######################################

######################################
# 1. provider 설정
######################################
terraform {
  required_providers {
    aws= {
      source = "hashicorp/aws"
      version = "6.26.0"
    }
  }
  backend "s3" {
    bucket = "myjustice-7979"
    key = "global/s3/terraform/tf.state"
    region = "us-east-2"
    dynamodb_table = "mylocktable"
    use_lockfile = true
  }
}

provider "aws" {
  region = "us-east-2"
}

######################################
# 2. DB(MySQL) 생성
######################################
# * username(dbuser)/password(dbpassword)
# * DB name
resource "aws_db_instance" "mydb" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.c6gd.medium"
  username             = "${var.dbuser}"
  password             = "${var.dbpassword}"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}
