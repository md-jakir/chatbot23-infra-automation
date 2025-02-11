variable "nextauth_secret" {
  description = "NextAuth secret value"
  type        = string
  sensitive   = true
}

variable "db_url" {
  description = "Database URL"
  type        = string
  sensitive   = true
}

variable "jwt_secret" {
  description = "JWT secret"
  type        = string
  sensitive   = true
}

variable "jwt_secret_for_verify" {
  description = "JWT secret for verify"
  type        = string
  sensitive   = true
}

variable "openai_api_key" {
  description = "OpenAI API key"
  type        = string
  sensitive   = true
}

variable "sender_password" {
  description = "Sender Password"
  type        = string
  sensitive   = true
}

variable "access_key" {
  description = "Access key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "Secret key"
  type        = string
  sensitive   = true
}

variable "session_token" {
  description = "Session token"
  type        = string
  sensitive   = true
}
