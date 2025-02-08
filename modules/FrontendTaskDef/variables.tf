variable "execution_role_arn" {
  description = "IAM role for ECS task execution"
  type        = string
}

variable "region" {
  description = "log group region"
  type        = string
}

variable "frontend" {
  description = "Frontend container configuration"
  type = object({
    image  = string
    cpu    = number
    memory = number
    port   = number
  })
}

variable "nextauth_secret_arn" {
  type        = string
  description = "The ARN of the NEXTAUTH_SECRET parameter from the parameter store."
}

variable "task_role_arn" {
  description = "IAM role for ECS task execution"
  type        = string
}

variable "project_name" {
  description = "The project Name"
  type        = string
}