terraform {
  required_version = ">=1.2.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

module "provider" {
  source = "../../modules/provider"
  access_key_temp = var.AWS_ACCESS_KEY
  secret_key_temp = var.AWS_SECRET_KEY
}

module "vpc" {
  source = "../../modules/vpc"
}

module "secrets" {
  source = "../../modules/secrets"

  name = "rds-sample"
}

module "rds" {
  source = "../../modules/rds"

  db_name        = "testdb"
  db_username    = "admin"
  db_password    = module.secrets.db_password
  vpc_id         = module.vpc.vpc_id
  pri_subnet1_ids = module.vpc.pri_subnet1_ids
}