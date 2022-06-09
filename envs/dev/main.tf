module "provider" {
  source = "./modules/provider"
}

module "vpc" {
  source = "./modules/vpc"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}