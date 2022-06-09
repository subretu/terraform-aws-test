variable "aws_access_key" {}
variable "aws_secret_key" {}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "ap-northeast-1"
}

module "VPC" {
  source = "./modules/vpc"
}

module "subnet" {
  source = "./modules/subnet"
}