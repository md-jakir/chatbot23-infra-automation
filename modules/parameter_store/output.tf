# output "nextauth_secret_arn" {
#   value = aws_ssm_parameter.parameters["nextauth_secret"].arn
#   description = "The ARN of the nextauth secret parameter"
# }

# output "db_url_arn" {
#   value = aws_ssm_parameter.parameters["db_url"].arn
#   description = "The ARN of the database URL parameter"
# }

# output "jwt_secret_arn" {
#   value = aws_ssm_parameter.parameters["jwt_secret"].arn
#   description = "The ARN of the JWT secret parameter"
# }

# output "jwt_secret_for_verify_arn" {
#   value = aws_ssm_parameter.parameters["jwt-secret-for-verify"].arn
#   description = "The ARN of the JWT secret for verify parameter"
# }

# output "openai_api_key_arn" {
#   value = aws_ssm_parameter.parameters["openai-api-key"].arn
#   description = "The ARN of the OpenAI API key parameter"
# }

# output "sender_password_arn" {
#   value = aws_ssm_parameter.parameters["sender-password"].arn
#   description = "The ARN of the Sender Password parameter"
# }

# output "access_key_arn" {
#   value = aws_ssm_parameter.parameters["access-key"].arn
#   description = "The ARN of the Access key parameter"
# }

# output "secret_key_arn" {
#   value = aws_ssm_parameter.parameters["secret-key"].arn
#   description = "The ARN of the Secret Key parameter"
# }

# output "session_token_arn" {
#   value = aws_ssm_parameter.parameters["session-token"].arn
#   description = "The ARN of the Session Token parameter"
# }

output "nextauth_secret_arn" {
  value = aws_ssm_parameter.nextauth_secret.arn
  description = "The ARN of the nextauth secret parameter"
}

output "db_url_arn" {
  value = aws_ssm_parameter.db_url.arn
  description = "The ARN of the database URL parameter"
}

output "jwt_secret_arn" {
  value = aws_ssm_parameter.jwt_secret.arn
  description = "The ARN of the JWT secret parameter"
}

output "jwt_secret_for_verify_arn" {
  value = aws_ssm_parameter.jwt_secret_for_verify.arn
  description = "The ARN of the JWT secret for verify parameter"
}

output "openai_api_key_arn" {
  value = aws_ssm_parameter.openai_api_key.arn
  description = "The ARN of the OpenAI API key parameter"
}

output "sender_password_arn" {
  value = aws_ssm_parameter.sender_password.arn
  description = "The ARN of the Sender Password parameter"
}

output "access_key_arn" {
  value = aws_ssm_parameter.access_key.arn
  description = "The ARN of the Access key parameter"
}

output "secret_key_arn" {
  value = aws_ssm_parameter.secret_key.arn
  description = "The ARN of the Secret Key parameter"
}

output "session_token_arn" {
  value = aws_ssm_parameter.session_token.arn
  description = "The ARN of the Session Token parameter"
}