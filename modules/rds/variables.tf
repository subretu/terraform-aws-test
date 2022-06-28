variable "db_name" {}

variable "db_username" {
  sensitive = true
}

variable "db_password" {
  sensitive = true
}

variable "vpc_id" {}

variable "pri_subnet_ids" {}

variable "engine" { default = "mysql" }

variable "engine_version" { default = "8.0.20" }

variable "db_instance" { default = "db.t2.micro" }
