variable "aws_access_key" {}
variable "aws_secret_key" {}

terraform {
  required_version = ">= 0.12.28"
  required_providers {
    aws = ">= 2.70.0"
  }
}

module "provider" {
  source = "./modules/provider"
  access_key_temp = var.aws_access_key
  secret_key_temp = var.aws_secret_key
}

module "vpc" {
  source = "./modules/vpc"
}