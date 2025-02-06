# resource "aws_ssm_parameter" "parameters" {
#   for_each    = var.ssm_parameters
#   name        = each.key
#   description = each.value.description
#   type        = each.value.type
#   value       = each.value.value

#   tags = {
#     Environment = "dev"
#   }
# }

resource "aws_ssm_parameter" "nextauth_secret" {
  name        = "nextauth_secret"
  type        = "SecureString"
  value       = var.nextauth_secret
  description = "NextAuth Secret"
}

resource "aws_ssm_parameter" "db_url" {
  name        = "db_url"
  type        = "SecureString"
  value       = var.db_url
  description = "Database URL"
}

resource "aws_ssm_parameter" "jwt_secret" {
  name        = "jwt_secret"
  type        = "SecureString"
  value       = var.jwt_secret
  description = "JWT Secret"
}

resource "aws_ssm_parameter" "jwt_secret_for_verify" {
  name        = "jwt-secret-for-verify"
  type        = "SecureString"
  value       = var.jwt_secret_for_verify
  description = "JWT Secret"
}

resource "aws_ssm_parameter" "openai_api_key" {
  name        = "openai-api-key"
  type        = "SecureString"
  value       = var.openai_api_key
  description = "JWT Secret"
}

resource "aws_ssm_parameter" "sender_password" {
  name        = "sender-password"
  type        = "SecureString"
  value       = var.sender_password
  description = "JWT Secret"
}

resource "aws_ssm_parameter" "access_key" {
  name        = "access-key"
  type        = "SecureString"
  value       = var.access_key
  description = "JWT Secret"
}

resource "aws_ssm_parameter" "secret_key" {
  name        = "secret-key"
  type        = "SecureString"
  value       = var.secret_key
  description = "JWT Secret"
}

resource "aws_ssm_parameter" "session_token" {
  name        = "session-token"
  type        = "SecureString"
  value       = var.session_token
  description = "JWT Secret"
}