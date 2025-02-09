# Network Variables
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones to use"
  type        = list(string)
}

# ALB $ Security Group variables
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

# ECS and Registry variables
variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "repository_names" {
  description = "Names of the ECR repositories to create"
  type        = list(string)
}

variable "codestart_connection" {
  type        = string
  description = "CodeStart Connection Name"
}

# Parameter Store variables
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
  description = "jwt secret"
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

# Common variables
variable "project_name" {
  description = "Project name for resources"
  type        = string
  default     = "chatbot23"
}

variable "region_name" {
  description = "Region Name"
  type        = string
}

# Container CPU and Memory Specification Variables
variable "frontend" {
  description = "Frontend container configuration"
  type = object({
    image  = string
    cpu    = number
    memory = number
    port   = number
  })
}

variable "backend" {
  description = "Backend container configuration"
  type = object({
    image  = string
    cpu    = number
    memory = number
    port   = number
  })
}

#CodeBuild and CodePipeline Variables
variable "pipeline_name" {
  type        = string
  description = "Name of the CodePipeline"
}

variable "codebuild_project_name" {
  type        = string
  description = "The backend codebulid project name"
}

variable "frontend_pipeline_name" {
  type        = string
  description = "Name of the CodePipeline"
}

variable "codebuild_fontend_project_name" {
  type        = string
  description = "The frontend codebulid project name"
}

# Vault Terraform Role ID and Secret ID
variable "vault_role_id" {
  description = "Vault Role ID"
  type        = string
  sensitive   = true
}

variable "vault_secret_id" {
  description = "Vault Secret ID"
  type        = string
  sensitive   = true
}

variable "public_alb_ingress_ports" {
  description = "The Security Group ingress port for public ALB"
  type = list(string)
}

variable "public_alb_egress_ports" {
  description = "The Security Group egress port for public ALB"
  type = list(string)
}

variable "internal_alb_ingress_ports" {
  description = "The internal ALB ingress ports"
  type = list(string)
}

variable "internal_alb_egress_ports" {
  description = "The internal ALB ingress ports"
  type = list(string)
}