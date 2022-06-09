terraform {
  required_version = ">= 0.12.28"
  required_providers {
    aws = ">= 2.70.0"
  }
}

module "provider" {
  source = "./modules/provider"
}

module "vpc" {
  source = "./modules/vpc"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}