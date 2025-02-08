variable "vpc_id" {
  description = "VPC ID where ALBs will be deployed"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs for internet-facing ALB"
  type        = list(string)
}

variable "private_subnets" {
  description = "List of private subnet IDs for internal-facing ALB"
  type        = list(string)
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "private_ip_targets" {
  description = "List of private IP addresses in private subnets for target groups"
  type        = list(string)
}

variable "frontend_sg_prefix_name" {
  description = "Frontend Security Group Prefix Name"
  type        = string
}

variable "backend_sg_prefix_name" {
  description = "Backend Security Group Prefix Name"
  type        = string
}

variable "app_frontend_sg" {
  description = "Frontend App Security Group Prefix Name"
  type        = string
}

variable "chatbot_frontend_alb" {
  description = "Frontend ALB Name"
  type        = string
}

variable "chatbot_backend_alb" {
  description = "Backend ALB Name"
  type        = string
}

variable "chatbot_frontend_tg" {
  description = "Frontend App Target Group Name"
  type        = string
}

variable "chatbot_backend_tg" {
  description = "Backend App Target Group Name"
  type        = string
}

variable "db_security_group" {
  description = "DB Security Group Name"
  type        = string
}