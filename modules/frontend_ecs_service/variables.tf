variable "frontend_taskdef_arn" {
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

variable "frontend_security_groups" {
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

variable "internet_alb_tg" {
  description = "Internet ALB Target Group"
  type        = string
}

variable "cluster_namespace" {
  description = "Internet ALB Target Group"
  type        = string
  default = "chatbot-cluster-namespace"
}

variable "container_port" {
  description = "Internet ALB Target Group"
  type        = string
  default = "80"
}

variable "frontend_container" {
  description = "Internet ALB Target Group"
  type        = string
  default = "admin-dashboard"
}

variable "frontend_discovery" {
  description = "Internet ALB Target Group"
  type        = string
  default = "admin-dashboard-svc"
}

variable "port_name_alias" {
  description = "Internet ALB Target Group"
  type        = string
  default = "admin-dashboard-80-tcp"
}

variable "internet_alb_name" {
  description = "Internet ALB Target Group"
  type        = string
}

variable "ecs_cluster_name" {
  description = "Internet ALB Target Group"
  type        = string
}