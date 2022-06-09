variable "access_key_temp" {}
variable "secret_key_temp" {}

provider "aws" {
  access_key = var.access_key_temp
  secret_key = var.secret_key_temp
  region = "ap-northeast-1"
}
