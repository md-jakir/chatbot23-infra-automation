resource "aws_ssm_parameter" "nextauth_secret" {
  name        = "${terraform.workspace}-NextAuthSecret"
  type        = "SecureString"
  value       = var.nextauth_secret
  description = "NextAuth Secret"
  tags = {
    Environment = terraform.workspace
  }
}

resource "aws_ssm_parameter" "db_url" {
  name        = "${terraform.workspace}-DBUrl"
  type        = "SecureString"
  value       = var.db_url
  description = "Database URL"
  tags = {
    Environment = terraform.workspace
  }
}

resource "aws_ssm_parameter" "jwt_secret" {
  name        = "${terraform.workspace}-JWTSecret"
  type        = "SecureString"
  value       = var.jwt_secret
  description = "JWT Secret"
  tags = {
    Environment = terraform.workspace
  }
}

resource "aws_ssm_parameter" "jwt_secret_for_verify" {
  name        = "${terraform.workspace}-JWTSecretForVerify"
  type        = "SecureString"
  value       = var.jwt_secret_for_verify
  description = "JWT Secret"
  tags = {
    Environment = terraform.workspace
  }
}

resource "aws_ssm_parameter" "openai_api_key" {
  name        = "${terraform.workspace}-OpenaiApiKey"
  type        = "SecureString"
  value       = var.openai_api_key
  description = "JWT Secret"
  tags = {
    Environment = terraform.workspace
  }
}

resource "aws_ssm_parameter" "sender_password" {
  name        = "${terraform.workspace}-SenderPassword"
  type        = "SecureString"
  value       = var.sender_password
  description = "JWT Secret"
  tags = {
    Environment = terraform.workspace
  }
}

resource "aws_ssm_parameter" "access_key" {
  name        = "${terraform.workspace}-AccessKey"
  type        = "SecureString"
  value       = var.access_key
  description = "JWT Secret"
  tags = {
    Environment = terraform.workspace
  }
}

resource "aws_ssm_parameter" "secret_key" {
  name        = "${terraform.workspace}-SecretKey"
  type        = "SecureString"
  value       = var.secret_key
  description = "JWT Secret"
  tags = {
    Environment = terraform.workspace
  }
}

resource "aws_ssm_parameter" "session_token" {
  name        = "${terraform.workspace}-SessionToken"
  type        = "SecureString"
  value       = var.session_token
  description = "JWT Secret"
  tags = {
    Environment = terraform.workspace
  }
}
