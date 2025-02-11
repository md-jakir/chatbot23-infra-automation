variable "vpc_id" {
  description = "VPC ID where ALBs will be deployed"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs for internet-facing ALB"
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

variable "public_alb_ingress_ports" {
  description = "The Security Group ingress port for public ALB"
  type        = list(string)
}

variable "public_alb_egress_ports" {
  description = "The Security Group egress port for public ALB"
  type        = list(string)
}

variable "internal_alb_ingress_ports" {
  description = "The internal ALB ingress ports"
  type        = list(string)
}

variable "internal_alb_egress_ports" {
  description = "The internal ALB ingress ports"
  type        = list(string)
}
