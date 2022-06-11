variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

terraform {
  required_version = ">= 0.12.28"
  required_providers {
    aws = ">= 2.70.0"
  }
}

module "provider" {
  source = "../modules/provider"
  access_key_temp = var.AWS_ACCESS_KEY
  secret_key_temp = var.AWS_SECRET_KEY
}

module "vpc" {
  source = "../modules/vpc"
}