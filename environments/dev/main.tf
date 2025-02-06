terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-06022025"
    key            = "environments/dev/terraform.tfstate"
    region         = "us-west-2"
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