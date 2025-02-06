variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "execution_role_arn" {
  description = "IAM role for ECS task execution"
  type        = string
}

variable "region" {
  description = "log group region"
  type        = string
  default = "ap-southeast-1"
}

variable "frontend" {
  description = "Frontend container configuration"
  type = object({
    image   = string
    cpu     = number
    memory  = number
    port    = number
  })
  default = {
    image   = "905418236735.dkr.ecr.ap-southeast-1.amazonaws.com/dev-chatbot-frontend:latest"
    cpu     = 256
    memory  = 512
    port    = 80
  }
}

variable "nextauth_secret_arn" {
  type        = string
  description = "The ARN of the NEXTAUTH_SECRET parameter from the parameter store."
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

variable "backend_discovery_name" {
  type        = string
  description = "The backend service discovery name"
  default = "backend-svc"
}

variable "task_role_arn" {
  description = "IAM role for ECS task execution"
  type        = string
}