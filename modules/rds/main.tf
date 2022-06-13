#--------------------------------------------------------------
# RDS
#--------------------------------------------------------------

resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.db_instance
  identifier           = var.db_name
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.rds-subnet-group.name
}

#--------------------------------------------------------------
# Subnet group
#--------------------------------------------------------------

resource "aws_db_subnet_group" "rds-subnet-group" {
  name        = var.db_name
  description = "rds subnet group for ${var.db_name}"
  subnet_ids  = var.pri_subnet1_ids
}
