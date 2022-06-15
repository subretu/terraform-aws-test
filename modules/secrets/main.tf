#--------------------------------------------------------------
# Secrets Manager
#--------------------------------------------------------------

resource "random_password" "db-password" {
  length           = 16
  special          = true
  override_special = "_!%^"
}

resource "aws_secretsmanager_secret" "db-password" {
  name = "${var.name}-db-password"
}

resource "aws_secretsmanager_secret_version" "db-password" {
  secret_id     = aws_secretsmanager_secret.db-password.id
  secret_string = random_password.db-password.result
  sensitive     = true
}
