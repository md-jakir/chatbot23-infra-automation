variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "execution_role_arn" {
  description = "IAM role for ECS task execution"
  type        = string
}

variable "task_role_arn" {
  description = "IAM role for ECS task execution"
  type        = string
}

variable "region" {
  description = "log group region"
  type        = string
  default = "ap-southeast-1"
}

variable "backend" {
  description = "Backend container configuration"
  type = object({
    image   = string
    cpu     = number
    memory  = number
    port    = number
  })
  default = {
    image   = "905418236735.dkr.ecr.ap-southeast-1.amazonaws.com/dev-chatbot-backend:latest"
    cpu     = 256
    memory  = 512
    port    = 8000
    hostport = 8000
  }
}

variable "db_url_arn" {
  type        = string
  description = "The ARN of the NEXTAUTH_SECRET parameter from the parameter store."
}

variable "jwt_secret_arn" {
  type        = string
  description = "The ARN of the JWT SECRET parameter from the parameter store."
}

variable "jwt_secret_for_verify_arn" {
  type        = string
  description = "The ARN of the JWT SECRET verify parameter from the parameter store."
}

variable "openai_api_key_arn" {
  type        = string
  description = "The ARN of the OpenAi API Key parameter from the parameter store."
}

variable "sender_password_arn" {
  type        = string
  description = "The ARN of the Sencer Password parameter from the parameter store."
}

variable "secret_key_arn" {
  type        = string
  description = "The ARN of the Secret Key parameter from the parameter store."
}

variable "access_key_arn" {
  type        = string
  description = "The ARN of the Access Key parameter from the parameter store."
}

variable "session_token_arn" {
  type        = string
  description = "The ARN of the Secret Key parameter from the parameter store."
}

variable "frontend_discovery_name" {
  type        = string
  description = "The frontend service discovery name"
  default = "admin-dashboard-svc"
}

variable "ecs_cluster_namespace" {
  type        = string
  description = "The cluster namespace name"
  default = "chatbot-cluster-namespace"
}