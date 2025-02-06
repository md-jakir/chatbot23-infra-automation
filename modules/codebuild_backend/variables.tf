variable "service_role_arn" {
  type        = string
  description = "The service role arn variable."
}

variable "codebuild_project_name" {
  type        = string
  description = "The backend codebulid project name"
  default = "chatbot-backend-proj"
}

variable "branch_name" {
  type        = string
  description = "The codebulid project name"
  default = "devops"
}

variable "log_stream_name" {
  type        = string
  description = "The codebulid project name"
  default = "chatbot-backend-log-stream"
}

variable "log_group_name" {
  type        = string
  description = "The codebulid project name"
  default = "chatbot-backend-log-group"
}