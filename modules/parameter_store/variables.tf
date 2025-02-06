# variable "ssm_parameters" {
#   type = map(object({
#     description = string
#     type        = string
#     value       = string
#   }))
#   default = {
#     # nextauth_secret_name = {
#     #   description = "Name of the nextauth secret"
#     #   type        = "String"
#     #   value       = "secret"
#     # },
#     nextauth_secret = {
#       description = "Secret Value for nextauth"
#       type        = "String"
#       #value       = getenv("NEXTAUTH_SECRET", "")
#       #default = ""
#     },
#     db_url = {
#       description = "Database URL for the application"
#       type        = "SecureString"
#       #value       = getenv("DB_URL", "")
#       #default = ""
#     },
#     jwt_secret = {
#       description = "JWT Secret for signing"
#       type        = "String"
#       #value       = getenv("JWT_SECRET", "")
#       #default = ""
#     },
#     jwt-secret-for-verify = {
#       description = "JWT Secret for verification"
#       type        = "String"
#       #value       = getenv("JWT_SECRET_FOR_VERIFY", "")
#       #default = ""
#     },
#     openai-api-key = {
#       description = "OpenAI API Key"
#       type        = "String"
#       #value       = getenv("OPENAI_API_KEY", "")
#       #default = ""
#     },
#     sender-password = {
#       description = "Sender Password"
#       type        = "String"
#       #value       = getenv("SENDER_PASSWORD", "")
#       #default = ""
#     },
#     access-key = {
#       description = "access key"
#       type        = "String"
#       #value       = getenv("key", "")
#       #default = ""
#     },
#     secret-key = {
#       description = "secret key"
#       type        = "String"
#       #value       = getenv("secret", "")
#       #default = ""
#     },
#     session-token = {
#       description = "Session Token"
#       type        = "String"
#       #value       = getenv("session_token", "")
#       #default = ""
#     }
#   }
# }

variable "nextauth_secret" {
  description = "NextAuth secret value"
  type        = string
  #default     = ""
}

variable "db_url" {
  description = "Database URL"
  type        = string
  #default     = ""
}

variable "jwt_secret" {
  description = "JWT secret"
  type        = string
  #default     = ""
  #sensitive = true
}

variable "jwt_secret_for_verify" {
  description = "JWT secret for verify"
  type        = string
  #default     = ""
}

variable "openai_api_key" {
  description = "OpenAI API key"
  type        = string
  #default     = ""
}

variable "sender_password" {
  description = "Sender Password"
  type        = string
  #default     = ""
}

variable "access_key" {
  description = "Access key"
  type        = string
  #default     = ""
}

variable "secret_key" {
  description = "Secret key"
  type        = string
  #default     = ""
}

variable "session_token" {
  description = "Session token"
  type        = string
  #default     = ""
}