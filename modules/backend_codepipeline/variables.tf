variable "pipeline_name" {
  type        = string
  description = "Name of the CodePipeline"
  #default = "ChatbotBackendPipeline"
}

variable "chatbot_codepipeline_role_arn" {
  type        = string
  description = "IAM Role ARN for CodePipeline"
}

variable "source_branch_name" {
  type        = string
  description = "Branch name of the repository to monitor"
  default     = "devops"
}

variable "build_project_name" {
  type        = string
  description = "CodeBuild project name"
  #default = "chatbot-frontend-proj"
}

variable "ecs_cluster_name" {
  type        = string
  description = "ECS Cluster Name"
}

variable "ecs_service_name" {
  type        = string
  description = "ECS Service Name"
}

variable "codestart_connection_arn" {
  type        = string
  description = "GitHub Connection ARN"
}

variable "project_name" {
  description = "The Projec Name"
  type        = string
}
