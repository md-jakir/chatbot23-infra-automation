variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "project_name" {
  description = "Project name for resources"
  type        = string
  default     = "chatbot23"
}

variable "environment" {
  description = "Environment for resources"
  type        = string
  default     = "dev"
}
