variable "backend_taskdef_arn" {
  type        = string
  description = "The ARN of the frontend task def."
}

# variable "public_subnets" {
#   description = "List of public subnet IDs for ECS service"
#   type        = list(string)
# }

variable "private_subnets" {
  description = "List of public subnet IDs for ECS service"
  type        = list(string)
}

variable "security_groups" {
  description = "List of security group IDs for ECS service"
  type        = list(string)
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, production)"
  type        = string
}

variable "aws_region" {
  description = "log group region"
  type        = string
  default = "ap-southeast-1"
}

variable "internal_alb_tg" {
  description = "Internet ALB Target Group"
  type        = string
}

variable "cluster_namespace" {
  description = "ECS Cluster NameSpace Name"
  type        = string
  default = "chatbot-cluster-namespace"
}

variable "container_port" {
  description = "Backend Container Port"
  type        = string
  default = "8000"
}

variable "backend_container" {
  description = "Backend Container Name"
  type        = string
  default = "backend"
}

variable "backend_discovery" {
  description = "Backend Discovery Name"
  type        = string
  default = "backend-svc"
}

variable "port_name_alias" {
  description = "Port Alias Name"
  type        = string
  default = "backend-port"
}

variable "internal_alb_name" {
  description = "Internal ALB Name"
  type        = string
}

variable "ecs_cluster_name" {
  description = "ECS Cluster Name"
  type        = string
}