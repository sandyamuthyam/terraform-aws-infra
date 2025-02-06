terraform {
  backend "s3" {
    bucket         = "your-s3-bucket-name-06022025"
    key            = "path/to/your/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock-table"
  }
}

provider "aws" {
  region = var.region
}

module "vpc" {
  source = "../../modules/vpc"
}

module "compute" {
  source          = "../../modules/compute"
  vpc_id          = module.vpc.vpc_id
  subnet_id       = module.vpc.public_subnet_id
  security_group_id = module.security_group.security_group_id
}

module "security_group" {
  source = "../../modules/security_group"
  vpc_id = module.vpc.vpc_id
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "your-s3-bucket-name"
  acl    = "private"

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

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}