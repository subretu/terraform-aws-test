output "db_password" { value = aws_secretsmanager_secret_version.db-password.secret_string }
