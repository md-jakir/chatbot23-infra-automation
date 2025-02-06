# modules/ecs_cluster/variables.tf
variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where ECS services will run"
  type        = string
}

variable "private_subnets" {
  description = "Private subnets for ECS services"
  type        = list(string)
}

variable "environment" {
  description = "Environment (e.g., dev, staging, prod)"
  type        = string
}
